package Date::Simple::Fmt;
use Date::Simple 3;
use base qw/Date::Simple/;
use overload '""' => '_format' ;

sub new {
    my ($class,$fmt,@args)=@_;
    my $self=$class->SUPER::new(@args);
    $self->default_format($fmt);
    $self
}

sub _format { shift->format() }

1;

=head1 NAME

Date::Simple::Fmt - Sub class of Date::Simple with per object level formatting for
overloaded stringification.

=head1 SYNOPSIS

    use Date::Simple::Fmt;

=head1 DESCRIPTION

This module changes the default stringification behaviour of Date::Simple objects to
use the format() method instead. It also changes the behaviour of the constructor.

=item Date::Simple::Fmt->new (FMT, [ARG, ...])

=item date_fmt (FMT, [ARG, ...])

Follows the same rules as for the equivelent method (new) and subroutine (date) in
Date::Simple except that the first argument is expected to be the default format for
the newly created object.  It is this format that will be used when using overloaded
stringification or when not providing a format argument to the format() method.

=head1 SEE ALSO

L<Date::Simple> for full documentation.

=cut
