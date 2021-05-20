#!perl
use strict;
use warnings;
use lib 'lib';

use Test::More;
use Test::Exception;
use Test::Warnings;

# Various
# https://proj.org/development/reference/functions.html#various

plan tests => 1 + 13*2 + 1;

use Geo::LibProj::FFI qw( :all );


my ($a, $b, $c, $d, $v, $union, $struct);


# proj_coord

($a, $b, $c, $d) = (12.5, -34.5, 67.5, -89.5);
lives_and { ok $union = proj_coord($a, $b, $c, $d) } 'coord';


# PJ_COORD

lives_and { $struct = 0; ok $struct = $union->xyzt } 'xyzt';
subtest 'PJ_XYZT' => sub {
	plan skip_all => "(xyzt failed)" unless $struct;
	plan tests => 8;
	is eval '$struct->x', $a, 'x';
	is eval '$struct->y', $b, 'y';
	is eval '$struct->z', $c, 'z';
	is eval '$struct->t', $d, 't';
	lives_ok { eval '$struct->x('.++$a.')' } 'inc x';
	lives_ok { eval '$struct->y('.++$b.')' } 'inc y';
	lives_ok { eval '$struct->z('.++$c.')' } 'inc z';
	lives_ok { eval '$struct->t('.++$d.')' } 'inc t';
};
lives_and { $struct = 0; ok $struct = $union->uvwt } 'uvwt';
subtest 'PJ_UVWT' => sub {
	plan skip_all => "(uvwt failed)" unless $struct;
	plan tests => 8;
	lives_and { is $struct->u(), $a } 'u';
	lives_and { is $struct->v(), $b } 'v';
	lives_and { is $struct->w(), $c } 'w';
	lives_and { is $struct->t(), $d } 't';
	lives_ok { $struct->u(++$a) } 'inc u';
	lives_ok { $struct->v(++$b) } 'inc v';
	lives_ok { $struct->w(++$c) } 'inc w';
	lives_ok { $struct->t(++$d) } 'inc t';
};
lives_and { $struct = 0; ok $struct = $union->lpzt } 'lpzt';
subtest 'PJ_LPZT' => sub {
	plan skip_all => "(lpzt failed)" unless $struct;
	plan tests => 8;
	lives_and { is $struct->lam(), $a } 'lam';
	lives_and { is $struct->phi(), $b } 'phi';
	lives_and { is $struct->z(), $c } 'z';
	lives_and { is $struct->t(), $d } 't';
	lives_ok { $struct->lam(++$a) } 'inc lam';
	lives_ok { $struct->phi(++$b) } 'inc phi';
	lives_ok { $struct->z(++$c) } 'inc z';
	lives_ok { $struct->t(++$d) } 'inc t';
};
lives_and { $struct = 0; ok $struct = $union->geod } 'geod';
subtest 'PJ_GEOD' => sub {
	plan skip_all => "(geod failed)" unless $struct;
	plan tests => 6;
	is eval '$struct->s', $a, 's';
	is eval '$struct->a1', $b, 'a1';
	is eval '$struct->a2', $c, 'a2';
	lives_ok { eval '$struct->s('.++$a.')' } 'inc s';
	lives_ok { eval '$struct->a1('.++$b.')' } 'inc a1';
	lives_ok { eval '$struct->a2('.++$c.')' } 'inc a2';
};
lives_and { $struct = 0; ok $struct = $union->opk } 'opk';
subtest 'PJ_OPK' => sub {
	plan skip_all => "(opk failed)" unless $struct;
	plan tests => 6;
	lives_and { is $struct->o(), $a } 'o';
	lives_and { is $struct->p(), $b } 'p';
	lives_and { is $struct->k(), $c } 'k';
	lives_ok { $struct->o(++$a) } 'inc o';
	lives_ok { $struct->p(++$b) } 'inc p';
	lives_ok { $struct->k(++$c) } 'inc k';
};
lives_and { $struct = 0; ok $struct = $union->enu } 'enu';
subtest 'PJ_ENU' => sub {
	plan skip_all => "(enu failed)" unless $struct;
	plan tests => 6;
	lives_and { is $struct->e(), $a } 'e';
	lives_and { is $struct->n(), $b } 'n';
	lives_and { is $struct->u(), $c } 'u';
	lives_ok { $struct->e(++$a) } 'inc e';
	lives_ok { $struct->n(++$b) } 'inc n';
	lives_ok { $struct->u(++$c) } 'inc u';
};
lives_and { $struct = 0; ok $struct = $union->xyz } 'xyz';
subtest 'PJ_XYZ' => sub {
	plan skip_all => "(xyz failed)" unless $struct;
	plan tests => 6;
	is eval '$struct->x', $a, 'x';
	is eval '$struct->y', $b, 'y';
	is eval '$struct->z', $c, 'z';
	lives_ok { eval '$struct->x('.++$a.')' } 'inc x';
	lives_ok { eval '$struct->y('.++$b.')' } 'inc y';
	lives_ok { eval '$struct->z('.++$c.')' } 'inc z';
};
lives_and { $struct = 0; ok $struct = $union->uvw } 'uvw';
subtest 'PJ_UVW' => sub {
	plan skip_all => "(uvw failed)" unless $struct;
	plan tests => 6;
	lives_and { is $struct->u(), $a } 'u';
	lives_and { is $struct->v(), $b } 'v';
	lives_and { is $struct->w(), $c } 'w';
	lives_ok { $struct->u(++$a) } 'inc u';
	lives_ok { $struct->v(++$b) } 'inc v';
	lives_ok { $struct->w(++$c) } 'inc w';
};
lives_and { $struct = 0; ok $struct = $union->lpz } 'lpz';
subtest 'PJ_LPZ' => sub {
	plan skip_all => "(lpz failed)" unless $struct;
	plan tests => 6;
	lives_and { is $struct->lam(), $a } 'lam';
	lives_and { is $struct->phi(), $b } 'phi';
	lives_and { is $struct->z(), $c } 'z';
	lives_ok { $struct->lam(++$a) } 'inc lam';
	lives_ok { $struct->phi(++$b) } 'inc phi';
	lives_ok { $struct->z(++$c) } 'inc z';
};
lives_and { $struct = 0; ok $struct = $union->xy } 'xy';
subtest 'PJ_XY' => sub {
	plan skip_all => "(xy failed)" unless $struct;
	plan tests => 4;
	is eval '$struct->x', $a, 'x';
	is eval '$struct->y', $b, 'y';
	lives_ok { eval '$struct->x('.++$a.')' } 'inc x';
	lives_ok { eval '$struct->y('.++$b.')' } 'inc y';
};
lives_and { $struct = 0; ok $struct = $union->uv } 'uv';
subtest 'PJ_UV' => sub {
	plan skip_all => "(uv failed)" unless $struct;
	plan tests => 4;
	lives_and { is $struct->u(), $a } 'u';
	lives_and { is $struct->v(), $b } 'v';
	lives_ok { $struct->u(++$a) } 'inc u';
	lives_ok { $struct->v(++$b) } 'inc v';
};
lives_and { $struct = 0; ok $struct = $union->lp } 'lp';
subtest 'PJ_LP' => sub {
	plan skip_all => "(lp failed)" unless $struct;
	plan tests => 4;
	lives_and { is $struct->lam(), $a } 'lam';
	lives_and { is $struct->phi(), $b } 'phi';
	lives_ok { $struct->lam(++$a) } 'inc lam';
	lives_ok { $struct->phi(++$b) } 'inc phi';
};
lives_and { $v = 0; ok $v = $union->v } 'v';
subtest 'vector' => sub {
	plan skip_all => "(v failed)" unless $struct;
	plan tests => 3;
	is_deeply $v, [$a, $b, $c, $d], 'v array';
	lives_ok { $union->v([ ++$a, ++$b, ++$c, ++$d ]) } 'inc v';
	is_deeply $union->v(), [25.5, -21.5, 77.5, -85.5], 'v array';
};


# proj_roundtrip

# proj_factors

# proj_torad

# proj_todeg

# proj_dmstor

# proj_rtodms

# proj_angular_input

# proj_angular_output

# proj_degree_input

# proj_degree_output


done_testing;
