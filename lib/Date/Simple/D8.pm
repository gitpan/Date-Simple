package Date::Simple::D8;
use Date::Simple 3;
use base qw/Date::Simple/;
use overload '""' => sub { $_[0]->as_d8 };
1;

=head1 NAME

Date::Simple::D8 - Sub class of Date::Simple with eight digit date style formatting
as default.

=head1 SYNOPSIS

    use Date::Simple::D8;

=head1 DESCRIPTION

This module changes the default stringification behaviour of Date::Simple objects to
use the as_d8() method instead.

=item Date::Simple::D8->new ([ARG, ...])

=item date_d8 ([ARG, ...])

Identical to Date::Simple except that uses the D8 style formatting ('%Y%m%d') for
overloaded stringification or when not providing a format argument to the format()
method.

=head1 SEE ALSO

L<Date::Simple> for full documentation.

=cut

