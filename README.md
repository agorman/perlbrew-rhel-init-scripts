# NAME

perlbrew-rhel-init-scripts - Init script templates for RHEL and perlbrew

# DESCRIPTION

This script will init your perlbrew environment and run the command and options
you configure.

You will need to edit a number of variables for the script to work properly

# VARIABLE LINES

export PERLBREW_ROOT=/opt/perl5/perlbrew

	The root path for your perlbrew install

export PERLBREW_HOME=/opt/perl5/home

	The home path for your perlbrew install

perlbrew use perl-5.12.3@test

	Initialize your perlbrew environment

APPNAME

	The name of your application. This is the name the init script will echo
	to the user.

APPDIR

	The directory where your application resides. The plackup script will cd to
	this directory before running.

COMMAND

	The command you want to run (e.g. perl, plackup).

SCRIPT

	The name of the script you are running.

OPTIONS

	Options that will be passed to your script.

PIDFILE

	The pid file location to be used by your daemon.

# AUTHOR

Andy Gorman agorman@cpan.org

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Andy Gorman.

This is free software; you can redistribute it and/or modify it under the same
terms as the Perl 5 programming language system itself.
