package Geo::Coordinates::Converter::Point;

use strict;
use warnings;

use base qw( Class::Accessor::Fast );
__PACKAGE__->mk_accessors(qw/ lat lng datum format height /);

use Storable ();

*latitude  = \&lat;
*longitude = \&lng;

sub clone {
    my $self = shift;
    my $clone = Storable::dclone($self);
    $clone;
}

1;

__END__

=head1 NAME

Geo::Coordinates::Converter::Point - the coordinates object

=head1 SYNOPSIS

    use strict;
    use warnings;

    use Geo::Coordinates::Converter::Point;

    my $point = Geo::Coordinates::Converter::Point->new({
        lat    => '35.65580',
        lng    => '139.65580',
        datum  => 'wgs84',
        format => 'degree',
    });

    my $point = Geo::Coordinates::Converter::Point->new({
        lat    => '35.39.24.00',
        lng    => '139.40.15.05',
        datum  => 'wgs84',
        format => 'dms',
    });

    my $clone = $point->clone;


=head1 DESCRIPTION

accessor of data concerning coordinates.
data is not processed at all.

=head1 METHODS

=over 4

=item new

constructor

=item lat

accessor of latitude

=item latitude

alias of lat

=item lng

accessor of longitude

=item longitude

alias of lng

=item datum

accessor of datum

=item format

accessor of coordinates format

=item clone

clone object

=back

=head1 AUTHOR

Kazuhiro Osawa E<lt>ko@yappo.ne.jpE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

