use strict;
use Test::More;
use Blosxom::Template;

my %expected = (
    'foo.html'     => [qw(foo html)],
    'foo.bar.html' => [qw(foo.bar html)],
);

while (my ($input, $expected) = each %expected) {
    #is_deeply [ Blosxom::Template::_split($input) ], $expected;
    is_deeply [ Blosxom::Template->_parse_basename($input) ], $expected;
}

done_testing;
