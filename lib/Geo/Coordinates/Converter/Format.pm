package Geo::Coordinates::Converter::Format;

use strict;
use warnings;
use base qw( Class::Accessor::Fast );

use Carp;

sub name { '' }
sub detect { croak 'This method is unimplemented' }

sub normaraiz { goto &normalize } # alias for backward compatibility
sub normalize {
    my($self, $point) = @_;

    for my $meth (qw/ lat lng /) {
        if ($point->$meth =~ /^\+(.+)$/) {
            $point->$meth($1);
        } elsif (my($prefix, $val) = $point->$meth =~ /^([NEWS])(.+)$/i) {
            $prefix =~ /^[WS]$/i ? $point->$meth("-$val") : $point->$meth($val);
        }
    }
}

sub to { $_[1] }
sub from { $_[1] }
sub round { $_[1] }

1;

__END__

=head1 NAME

Geo::Coordinates::Converter::Format - geo coordinates format converter

=head1 DESCRIPTION

it undergoes plastic operation on the format of coordinates.

as for these formats, the added thing is possible.

=head1 AUTHOR

Kazuhiro Osawa E<lt>ko@yappo.ne.jpE<gt>

=head1 SEE ALSO

L<Geo::Coordinates::Converter>, 
L<Geo::Coordinates::Converter::Format::Dms>, L<Geo::Coordinates::Converter::Format::Degree>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
