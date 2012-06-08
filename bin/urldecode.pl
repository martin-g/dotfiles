#!/usr/bin/perl

use strict;
use warnings;


my $input = $ARGV[0];
$input =~ s/\%([A-Fa-f0-9]{2})/pack('C', hex($1))/seg;

print "\n$input\n";
