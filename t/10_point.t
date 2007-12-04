use strict;
use Test::Base;

use Geo::Coordinates::Converter::Point;

plan tests => 6 * blocks;

filters { point => 'yaml' };

run {
    my $block = shift;
    my $geo = Geo::Coordinates::Converter::Point->new($block);

    is $geo->$_, $block->$_ for (qw/ lat lng datum format /);
    is $geo->latitude,  $block->lat;
    is $geo->longitude, $block->lng;
}

__END__

===
--- point
lat: 35.65580
lng: 139.65580
datum: wgs84
format: degree

===
--- point
lat: 35.39.24.00
lng: 139.40.15.05
datum: wgs84
format: dms
