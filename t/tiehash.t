use strict;
use Blosxom::Template;
use Test::More;

{
    package blosxom;

    our %template = (
        html => {
            head  => 'foo',
            story => 'bar',
        },
        rss => {
            head  => 'bar',
            story => 'baz',
        },
    );
}

tie my %template => 'Blosxom::Template';

is $template{'head.html'}, 'foo';
ok exists $template{'head.html'};
ok !exists $template{'foot.html'};

my @basenames = sort keys %template;
is_deeply \@basenames, [qw/head.html head.rss story.html story.rss/];

done_testing;
