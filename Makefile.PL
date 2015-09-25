use inc::Module::Install;
use Module::Install::ReadmeFromPod;
use Module::Install::ReadmeMarkdownFromPod; 
use Module::Install::GithubMeta;
use Module::Install::Repository;
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

build_requires 'Test::Base';
build_requires 'Test::More';
build_requires 'YAML';

test_requires 'Test::Perl::Critic';
test_requires 'Test::Spelling';

auto_set_repository;
WriteAll;
