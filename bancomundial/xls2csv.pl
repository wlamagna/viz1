#!/usr/bin/perl
use strict;
use warnings;
use Spreadsheet::XLSX;

 
my $excel = Spreadsheet::XLSX -> new ($ARGV[0]);
my $line;
foreach my $sheet (@{$excel -> {Worksheet}}) {
    printf("Sheet: %s\n", $sheet->{Name});
    $sheet -> {MaxRow} ||= $sheet -> {MinRow};
    foreach my $row ($sheet -> {MinRow} .. $sheet -> {MaxRow}) {
        $sheet -> {MaxCol} ||= $sheet -> {MinCol};
        #foreach my $col ($sheet -> {MinCol} ..  $sheet -> {MaxCol}) {
	for my $col (0..7) {
            my $cell = $sheet -> {Cells} [$row] [$col];
            if ($cell) {
		#print $row . ":" . $col . ":" . $cell->{Val};
                $line .= "($col)".$cell -> {Val}."\t";
            }
        }
        chomp($line);
        print "$line\n";
	#print "\n";
        $line = '';
    }
}
