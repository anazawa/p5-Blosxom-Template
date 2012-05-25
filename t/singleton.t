use strict;
use Blosxom::Template;
use Test::More tests => 5;

{
    package blosxom;
    our %template = ( html => { head => 'foo' } );
}

ok !$Blosxom::Template::INSTANCE, 'no Blosxom::Template instance yet';

my $t1 = Blosxom::Template->instance;
ok $t1, 'created Blosxom::Template instance 1';

my $t2 = Blosxom::Template->instance;
ok $t2, 'created Blosxom::Template instance 2';

is $t1, $t2, 'both instances are the same object';
is $Blosxom::Template::INSTANCE, $t1, 'Blosxom::Template has instance';
