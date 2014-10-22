#!/usr/bin/perl -w
use strict;
use Test;

BEGIN { plan tests => 55 }

use Date::Simple;

use POSIX qw(strftime);

#------------------------------------------------------------------------------
# Check validate method
#------------------------------------------------------------------------------
ok(Date::Simple->new(2000, 12, 25));
ok(not Date::Simple->new(2000, 13, 25));
ok(not Date::Simple->new(2000, 0, 25));
ok(not Date::Simple->new(2000, 12, 32));
ok(not Date::Simple->new(2000, 12, 0));
ok(Date::Simple->new(1996, 02, 29));
ok(not Date::Simple->new(1900, 02, 29));

ok(Date::Simple->new('2000-12-25'));
ok(not Date::Simple->new('2000-13-25'));
ok(not Date::Simple->new('2000-00-25'));
ok(not Date::Simple->new('2000-12-32'));
ok(not Date::Simple->new('2000-12-00'));
ok(Date::Simple->new('1996-02-29'));
ok(not Date::Simple->new('1900-02-29'));

#------------------------------------------------------------------------------
# Check new method with parameters
#------------------------------------------------------------------------------

ok(not Date::Simple->new(2000, 2, 30));
ok(my $d = Date::Simple->new(2000, 2, 28));
ok(my $d2 = Date::Simple->new('2000-02-28'));
ok($d, $d2);

ok(2000, $d->year);
ok(2, $d->month);
ok(28, $d->day);

ok("$d" eq "2000-02-28");

#------------------------------------------------------------------------------
# Date arithmetic
#------------------------------------------------------------------------------

ok($d += 7);
ok("$d", "2000-03-06");

ok($d -= 14);
ok("$d", "2000-02-21");

ok($d cmp "2001-07-01", -1);
ok($d <=> [2001, 7, 1], -1);

ok($d2 = $d + 7);
ok("$d2", "2000-02-28");

ok($d2->prev, "2000-02-27");
ok($d2->next, "2000-02-29");

ok($d2-$d, 7);

ok( ($d + 0), $d);
ok( ($d + -3), ($d - 3));
ok( ($d - -3), ($d + 3));

#------------------------------------------------------------------------------
# try again with another date
#------------------------------------------------------------------------------

ok($d = Date::Simple->new('1998-02-28'));

ok(1998 == $d->year);
ok(2 == $d->month);
ok(28 == $d->day);

ok($d += 7);
ok("$d", "1998-03-07");

ok($d -= 14);
ok("$d", "1998-02-21");

ok($d2 = $d + 7);
ok("$d2", "1998-02-28");

ok($d2->prev, "1998-02-27");
ok($d2->next, "1998-03-01");

ok($d = Date::Simple->new('1972-01-17'));
ok($d->year, 1972);
ok($d->month, 1);
ok($d->day, 17);

ok($d->format, '1972-01-17');
ok($d->format('%d %b %Y'), '17 Jan 1972');
ok($d->format('Foo'), 'Foo');

