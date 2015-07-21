#!/bin/perl

my $i ;
my $line ;
my @cols ;

while (<>)
{
	chomp ;
	print $_, "\t" ;
	for ($i = 0 ; $i < 80 ; ++$i )
	{
		$line = <> ;
		chomp $line ;
		
		if ( ( $i - 7 ) % 19 <= 2 )
		{
			@cols = split /\s/, $line ;
			print $cols[1], "\t" ;
		}
		elsif ( ( $i - 7 ) % 19 <= 6 )
		{
			@cols = split /\s/, $line ;
			print $cols[1] * 100, "\t"
		}
	}
	print "\n" ;
}
