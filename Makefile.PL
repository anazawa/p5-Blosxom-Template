use inc::Module::Install;

name 'Blosxom-Template';
all_from 'lib/Blosxom/Template.pm';

test_requires 'Test::More';

WriteAll;

