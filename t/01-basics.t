#!perl

use 5.010;
use strict;
use warnings;

use Gen::Test::Rinci::FuncResult qw(gen_test_func);
use Test::More 0.98;

sub divide {
    my %args = @_;
    my ($a, $b) = ($args{a}, $args{b});
    return [500, "undefined"] if $a == 0 && $b == 0;
    [200, "OK", $a/$b];
}
gen_test_func(name => 'test_divide', func => \&divide);

ok(test_divide(args=>{a=>6, b=>3}, result=>2));
ok(test_divide(args=>{a=>6, b=>0}, dies=>1));
ok(test_divide(args=>{a=>0, b=>0}, status=>500));

# TODO: use Test::Builder to test failure cases

DONE_TESTING:
done_testing;
