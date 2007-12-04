package Geo::Coordinates::Converter::Format::Dms;

use strict;
use warnings;
use base qw( Geo::Coordinates::Converter::Format );

use POSIX;

our $DIGITS = 3;

sub name { 'dms' }

sub detect {
    my($self, $point) = @_;

    return unless $point->lat =~ /^[\-\+NS]?\d{1,2}\.\d\d\.\d\d(?:\.\d+)$/i;
    return unless $point->lng =~ /^[\-\+EW]?\d{1,3}\.\d\d\.\d\d(?:\.\d+)$/i;
    return $self->name;
}

sub to {
    my($self, $point) = @_;

    for my $meth (qw/ lat lng /) {
        my($ws, $deg, $min, $sec) = $point->$meth =~ /^(\-?)(\d+)\.(\d+)\.(\d+(?:\.\d+)?)$/i;
        my $ret = $deg + ($min / 60) + ($sec / 3600);
        $ret = $ws =~ /\-/i ? -1 * $ret : $ret;
        $point->$meth($ret);
    }

    $point;
}

sub from {
    my($self, $point) = @_;

    for my $meth (qw/ lat lng /) {
        my($ws, $degree) = $point->$meth =~ /^(\-?)(.+)$/;
        
        my $deg  = floor($degree);
        my $min  = floor(($degree - $deg) * 60 % 60);
        my $sec  = ($degree - $deg) * 3600 - $min * 60;
        $point->$meth(sprintf "%s%s.%s.%s", $ws || '', $deg, $min, $sec);
    }

    $point;
}

sub round {
    my($self, $val) = @_;
    sprintf "%s%s.%02d.%06.${DIGITS}f", ($val =~ /^(\-?)([^\.]+)\.([^\.]+)\.(.+)$/);
}

1;
