#!perl
use strict;
use warnings;
use lib 'lib';

use Test::More;
use Test::Exception;
use Test::Warnings;

# Error reporting and logging
# https://proj.org/development/reference/functions.html#error-reporting

plan tests => 2 + 8 + 5 + 1;

use Geo::LibProj::FFI qw( :all );


my ($p, $e);


# proj_log_level

lives_ok { proj_log_level(0, PJ_LOG_NONE) } 'log_level none';
lives_and { is proj_log_level(0, PJ_LOG_TELL), PJ_LOG_NONE } 'log_level tell';

# proj_errno
# proj_errno_set
# proj_errno_reset
# proj_errno_restore

lives_and { ok $p = proj_create(0, "EPSG:4326") } 'proj_create';
lives_ok { proj_errno_set($p, 123) } 'errno_set 1';
lives_and { ok $e = proj_errno_reset($p) } 'errno_reset';
lives_ok { proj_errno_set($p, 234) } 'errno_set 2';
lives_and { is proj_errno($p), 234 } 'errno is set';
lives_ok { proj_errno_restore($p, $e) } 'errno_restore';
lives_and { is proj_errno($p), 123 } 'errno is restored';
lives_ok { proj_destroy($p) } 'proj_destroy';


diag "testing expected failure ...";
# PJ_LOG_NONE doesn't seem to have an effect on PROJ 7
lives_and { ok ! proj_create(0, "+proj=tpers") } 'proj_create fail';

# proj_context_errno

lives_and { ok $e = proj_context_errno(0) } 'context_errno';
lives_and { ok $e == 1027 || $e == -30 } 'context_errno value';

# proj_errno_string

lives_and { like proj_errno_string($e), qr/\bInvalid value\b|\bh\b/i } 'errno_string';

# proj_context_errno_string

lives_and { like proj_context_errno_string(0, $e), qr/\bInvalid value\b|\bh\b/i } 'context_errno_string';


done_testing;
