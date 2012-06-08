#!/usr/bin/perl

use strict;
use warnings;

use Cwd;

my $rev = $ARGV[0];

$rev =~ s/.*?(\d+).*/$1/;
my $revMinusOne = int($rev) - 1;

my $FAS_TRUNK_URL   = 'svn+ssh://martin@svn.fredhopper.com/local/svn/fred/trunk/fred';

my $oldDir = getcwd();

print `svn merge -r $revMinusOne:$rev $FAS_TRUNK_URL`;

