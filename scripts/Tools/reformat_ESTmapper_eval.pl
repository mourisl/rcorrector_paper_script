#!/bin/perl

my $i ;

while (<>)
{
	chomp ;
	my $prog = $_ ;
	print $prog, "\t" ;
	my $line ;
	for ( $i = 0 ; $i < 21 ; ++$i )
	{
		$line = <> ;
	}
	chomp $line ;
	my $val = ( split /\s+/, $line )[2] ;
	print $val * 100.0, "\t" ;
	
	for ( $i = 0 ; $i < 21 ; ++$i )
	{
		$line = <> ;
	}
	chomp $line ;
	my $val = ( split /\s+/, $line )[2] ;
	print $val * 100.0, "\t" ;

	for ( $i = 0 ; $i < 12 ; ++$i )
	{
		$line = <> ;
		if ( $line =~ /recall/ || $line =~ /precision/ )
		{
			my $val = ( split /\s+/, $line )[2] ;
			print $val * 100.0, "\t" ;
		}
	}
	print "\n" ;
}
