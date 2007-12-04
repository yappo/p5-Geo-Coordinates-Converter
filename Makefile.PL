use inc::Module::Install;
 
name 'Geo-Coordinates-Converter';
all_from 'lib/Geo/Coordinates/Converter.pm';

build_requires 'Test::More';

requires $_ for (qw/ Class::Accessor::Fast Readonly String::CamelCase Storable UNIVERSAL::require /);

use_test_base;
auto_include;
auto_install;
WriteAll;
