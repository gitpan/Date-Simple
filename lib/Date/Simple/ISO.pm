package Date::Simple::ISO;
use Date::Simple 3;
use base qw/Date::Simple/;
use overload '""' => sub { $_[0]->as_iso };

1;

=head1 NAME

Date::Simple::ISO - Sub class of Date::Simple

=head1 SYNOPSIS

    use Date::Simple::ISO;

=head1 DESCRIPTION

This module is entirely identical to Date::Simple. It is included for completness
and self documenting sake.  IMO it is preferable to say

  my $obj=Date::Simple::ISO->new(...);

As this makes the implicit formatting of the object clear.

=head1 SEE ALSO

L<Date::Simple> for full documentation.

=cut
