#!/usr/bin/perl

#
# Usage
#	cat someAsciiFile.properties | ascii2xmlJavaProperties.pl
#

use strict;
use warnings;

my $xmlStart = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
';

print $xmlStart;

while (<STDIN>) {

	# ignore blank lines
	next if m/^\s*$/;

	# ignore comments
	next if m/^#/;

	m/^(.*)\s*\=\s*(.*)$/;
	my ($key, $value) = ($1, $2);
	
	# trim keys
	$key =~ s/^\s+//;
	$key =~ s/\s+$//;	
	
	warn $_ unless (defined $key and defined $value);
	print "<entry key=\"$key\">$value</entry>\n";
}

my $xmlEnd = '</properties>';

print $xmlEnd;

