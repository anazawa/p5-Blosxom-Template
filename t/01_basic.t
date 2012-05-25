use strict;
use Test::More;
use Blosxom::Template;

{
    package blosxom;
    our %template;
}

{
    #my %templates = ();
    #my $t = Blosxom::Template->new(\%templates);
    local $Blosxom::Template::INSTANCE;
    my $t = Blosxom::Template->instance;

    isa_ok $t, 'Blosxom::Template';
    can_ok $t, qw(get set delete clear exists);
    #is_deeply $t, { templates => \%templates }
}

{
    #my %templates = ( html => { foo => 'bar' } );
    local $Blosxom::Template::INSTANCE;
    local %blosxom::template = ( html => { foo => 'bar' } );
    #my $t = Blosxom::Template->new(\%templates);
    my $t = Blosxom::Template->instance;
    $t->set('foo.html' => 'baz');
    #is_deeply \%templates, { html => { foo => 'baz' } };
    is_deeply \%blosxom::template, { html => { foo => 'baz' } };
}

{
    #my %templates = ( html => { foo => 'bar' } );
    local $Blosxom::Template::INSTANCE;
    local %blosxom::template = ( html => { foo => 'bar' } );
    #my $t = Blosxom::Template->new(\%templates);
    my $t = Blosxom::Template->instance;
    $t->set('bar.html' => 'baz');
    #is_deeply \%templates, { html => { foo => 'bar', bar => 'baz' } };
    is_deeply \%blosxom::template, { html => { foo => 'bar', bar => 'baz' } };
}

{
    #my %templates = ( html => { foo => 'bar' } );
    local $Blosxom::Template::INSTANCE;
    local %blosxom::template = ( html => { foo => 'bar' } );
    #my $t = Blosxom::Template->new(\%templates);
    my $t = Blosxom::Template->instance;
    is $t->get('foo.html'), 'bar';
}

{
    #my %templates = ( html => { foo => 'bar', bar => 'baz' } );
    local $Blosxom::Template::INSTANCE;
    local %blosxom::template = ( html => { foo => 'bar', bar => 'baz' } );
    #my $t = Blosxom::Template->new(\%templates);
    my $t = Blosxom::Template->instance;
    #$t->remove('foo.html');
    $t->delete('foo.html');
    #is_deeply \%templates, { 'html' => { bar => 'baz' } };
    is_deeply \%blosxom::template, { 'html' => { bar => 'baz' } };
}

{
    #my %templates = ( html => { foo => 'bar' } );
    local $Blosxom::Template::INSTANCE;
    local %blosxom::template = ( html => { foo => 'bar' } );
    #my $t = Blosxom::Template->new(\%templates);
    my $t = Blosxom::Template->instance;
    is $t->exists('foo.html'), 1;
}

done_testing;
