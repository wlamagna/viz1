#!/usr/bin/perl
# Author: Walter M. Lamagna
# Mayo 2021 ; Transform the output of unoconv to the correct format
#

open A, "$ARGV[0]" or die ("no pude abrir $ARGV[0]");

while (<A>) {
	chomp;
	my ($proj, @rest) = split("\t", $_);
	if ($proj =~ /^P[0-9]/) {
		print "\n$proj\t";
		print join ("\t", @rest);
	} else {
		print;
	}
}
close A;
