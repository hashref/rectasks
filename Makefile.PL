use strict;
use warnings;

use 5.009_001;

use ExtUtils::MakeMaker;
WriteMakefile(
  NAME             => 'rectasks',
  AUTHOR           => 'David Betz <hashref@gmail.com>',
  VERSION_FROM     => 'script/rectasks',
  ABSTRACT         => 'A script to record daily tasks to an Obsidian Daily Journal',
  LICENSE          => 'perl',
  MIN_PERL_VERSION => '5.9.1',
  PREREQ_PM        => {
    'Readonly' => '2.05',
  },
  TEST_REQUIRES => { 'Test::More' => '0.48' },
  EXE_FILES     => ['script/rectasks'],
  META_MERGE    => {
    'meta-spec' => { version => 2 },
    resources   => {
      repository => {
        type => 'git',
        url  => 'https://github.com/hashref/rectasks.git',
        web  => 'https://github.com/hashref/rectasks',
      },
      bugtracker => { web => 'https://github.com/hashref/rectasks/issues' },
    },
  },
);
