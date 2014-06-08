package SHARYANTO::Term::Util;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.01'; # VERSION
our $DATE = '2014-06-07'; # DATE

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       hr
               );

my $o;

sub hr {
    my $char = shift;
    $char  = "=" if !defined($char) || !length($char);
    my $w  = $o->term_width;
    my $n  = int($w / length($char))+1;
    my $hr = substr(($char x $n), 0, $w);
    return $hr if defined(wantarray);
    if ($^O =~ /MSWin/) {
        substr($hr, -1, 1) = '';
    }
    say $hr;
}

# a dummy class just to use TermAttrs
{
    package SHARYANTO::Term::Util::object;
    use Moo;
    with 'SHARYANTO::Role::TermAttrs';
}
$o = SHARYANTO::Term::Util::object->new;

1;
# ABSTRACT: Terminal utilities

__END__

=pod

=encoding UTF-8

=head1 NAME

SHARYANTO::Term::Util - Terminal utilities

=head1 VERSION

This document describes version 0.01 of SHARYANTO::Term::Util (from Perl distribution SHARYANTO-Term-Util), released on 2014-06-07.

=head1 FUNCTIONS

=head2 hr([CHAR]) => optional STR

Print (under void context) or return (under scalar/array context) a horizontal
bar with the width of the terminal.

C<CHAR> is optional, can be multicharacter, but cannot be empty string. The
defautl is C<=>.

Under Windows, when printing, will shave one character at the end because the
terminal cursor will move a line down when printing at the last column.

=head1 SEE ALSO

L<SHARYANTO>

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/SHARYANTO-Term-Util>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-SHARYANTO-Term-Util>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=SHARYANTO-Term-Util>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
