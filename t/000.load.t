use strict;
use warnings;

use Test::More tests => 1;
use File::Path;

is( system(qq{perl -c cpanspec}), 0, 'test sytnax OK' );

