use inc::Module::Install;
name 'Geo-Coordinates-Converter';
all_from 'lib/Geo/Coordinates/Converter.pm';
readme_from 'lib/Geo/Coordinates/Converter.pm';
readme_markdown_from 'lib/Geo/Coordinates/Converter.pm';
githubmeta;

requires 'parent';
requires 'Class::Accessor::Lite' => '0.05';
requires 'Module::Load';
requires 'String::CamelCase';
requires 'Storable';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
test_requires 'YAML';
use_test_base;

auto_set_repository;
auto_include;
WriteAll;
