use strict;
use warnings;

use Test::More tests => 2;
use File::Path;

is( system(qq{perl -c bin/cpanspec}), 0, 'cpanspec sytnax OK' );
is( system(qq{perl -c bin/cs-docker}), 0, 'cs-docker sytnax OK' );

