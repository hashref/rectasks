#!/usr/bin/env perl -w

use Test::More tests => 3;

# Verify taskwarrior is installed and the version is high enough.
( my $task_exe_version = `task --version 2>&1` ) =~ s/\.|\n//g;
ok( $task_exe_version , 'taskwarrior installed' );
ok( $task_exe_version >= 262, 'taskwarrior version > 2.6.2' );

( my $task_today_command = `task today 2>&1` ) =~ s/\n*$//g;
unlike( $task_today_command, '/^no matches\.$/i', 'today report defined' );

done_testing();

