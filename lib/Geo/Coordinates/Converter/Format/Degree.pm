package Geo::Coordinates::Converter::Format::Degree;

use strict;
use warnings;
use base qw( Geo::Coordinates::Converter::Format );

our $DIGITS = 6;

sub name { 'degree' }

sub detect {
    my($self, $point) = @_;

    return unless $point->lat =~ /^[\-\+NS]?\d{1,2}(?:\.\d+)$/i;
    return unless $point->lng =~ /^[\-\+WE]?\d{1,3}(?:\.\d+)$/i;
    return $self->name;
}

sub round {
    my($self, $val) = @_;
    sprintf "%0${DIGITS}f", $val;
}

1;
