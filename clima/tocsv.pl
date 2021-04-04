#!/usr/bin/perl

open A, "pronostico_5dias20210404.txt" or die ("No encontre archivo");

my %mes =  ('ENE', 1, 'FEB', 2, 'MAR', 3, 'ABR', 4, 'MAY', 5, 'JUN',6,'JUL',7,'AGO',8,'SEP',9,'OCT',10,'NOV',11,'DIC',12);

my $inplace = 0;
while (<A>) {
	s/\r//g;
	s/\n//g;
	next if (/^ =====/);

	if ((/^ [A-Z][A-Z].*/) && ($inplace)) {
		$inplace = 0;
		close B;
	}
	if ($inplace) {
		if (/      FECHA/) {
			print B "fecha,temp,vientodir,vientokm,precip\n";
			next;
		}
		next if (/.*DIR.*KM.*/);
		s/^\s*//g;
		s/\|//g;
		s/\s{3,13}/,/g;
		s/Hs\./:00/g;
		my @records = split(",");
		my ($day,$month,$year) = split("/", $records[0]);
		$day =~ s/^0//g;
		print B "$day/" . $mes{$month} . "/$year";
		print B ",$records[1]";	#temp
		print B ",$records[2]";	#vientodir
		print B ",$records[3]";	#vientokm
		print B ",$records[4]";	#precip
		print B "\n";
	}

	if (/^ [A-Z][A-Z].*/) {
		$inplace = 1;
		my $filename = "$_" . ".csv";
		$filename =~ s/^ //g;
		open B, ">$filename" or die ("No pude crear $filename");
	}
}
close A;
