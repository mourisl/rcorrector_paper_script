#!/bin/perl

use strict ;

# Find the coordinates and supports for microexons
my $usage = "perl a.pl < xxx.sam" ;

# SRR531865.6582	83	scaffold_2	18362552	255	75M	=	18362146	-481	ATGGGAATCAGCATGGCTTTTATGGCAGCCATGAGAGGGTATAAAATGGTTCTCACTATGCCGTCTTACACAAGC	X`^YR^\\\KY]_ZRH]aaaa^_[P_a^abbbabab_^_bbbbbbbb_`bbbbbabbbbbbbbbbbbbbbbbbba	AS:i:0	XN:i:0	XM:i:0	XO:i:0	XG:i:0	NM:i:0	MD:Z:75	YS:i:0	YT:Z:CP

my %microExons ;

while(<>)
{
	my $line = $_ ;
	my @cols = split /\s+/, $line ;
	next if ( ( $cols[1] & 0x900 ) != 0 ) ;
	if ( /MD:Z:(.+?)\s/ )
	{
		;
	}
	else
	{
		next ;
	}

	my $chr = $cols[2] ;
	my $start = $cols[3] ;
	my @offsets ;
	my @ops ;
	my $pos ;
	@offsets = split /[A-Za-z]+/, $cols[5] ;
	@ops = split /[0-9]+/, $cols[5] ;
	shift @ops ;

	$pos = $start ;
	my $exonStart = -1 ;
	for ( my $i = 0 ; $i < scalar( @ops ) ; ++$i )
	{
		if ( $ops[$i] eq "N" )	
		{
			if ( $exonStart != -1 && $pos - $exonStart < 20 )
			{
				my $key = $chr." ".$exonStart." ".( $pos - 1 ) ;
				#if ( defined ( $microExons{ $key } ) )
				#{
					++$microExons{ $key } ;
				#}
				#else
				#{
				#	$microExons{ $key } = 1 ;
				#}
			}
			$exonStart = $pos + $offsets[$i] ;
		}
		next if ( $ops[$i] eq "I" || $ops[$i] eq "S" || $ops[$i] eq "H" ) ;
		$pos += $offsets[$i] ;
	}
}

foreach my $key (sort (keys %microExons) )
{
	print $key, " ", $microExons{ $key }, "\n" ;
}
