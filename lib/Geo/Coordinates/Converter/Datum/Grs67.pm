package Geo::Coordinates::Converter::Datum::Grs67;

use strict;
use warnings;
use base qw( Geo::Coordinates::Converter::Datum );

sub name { 'grs67' }
sub radius { 6378160 }
sub rate { 0.006694605 }

1;
