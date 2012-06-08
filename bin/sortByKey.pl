#!/usr/bin/perl

# Sorts Java properties file by its keys

use strict;
use warnings;


my $hrefContent = {};

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

	$hrefContent->{$key} = $value;
}

foreach my $k (sort(keys(%{$hrefContent}))) {
	my $v = $hrefContent->{$k};
	print "$k=$v\n";
}
