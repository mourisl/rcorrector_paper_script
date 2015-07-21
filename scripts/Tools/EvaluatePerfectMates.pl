#!/bin/perl

use strict ;

my $usage = "perl a.pl orig.perfect_mates other_mates" ;

open FP1, $ARGV[0] ;

my %origReads ;
my %timeStamp ;
while ( <FP1> )
{
	chomp ;
	my @cols = split ;

	$origReads{ $cols[0] } = $cols[1]." ".$cols[2] ;
	$timeStamp{ $cols[0] } = -1 ;
}
close FP1 ;

for ( my $i = 1 ; $i < scalar( @ARGV ) ; ++$i )
{
	open FP1, $ARGV[$i] ;
	print $ARGV[$i], " " ;

	my $fp = 0 ;	
	my $tp = 0 ; 
	while ( <FP1> )
	{
		chomp ;
		my @cols = split ;

		if ( !( defined $origReads{ $cols[0] } ) )
		{
			++$tp ;
			next ;
		}
		else
		{
			my $val = $cols[1]." ".$cols[2] ;
			if ( $val ne $origReads{ $cols[0] } ) 
			{
				++$fp ;
				#print "Shift\n" ;
			}
			$timeStamp{ $cols[0] } = $i ;
		}
	}

	foreach my $key (keys %timeStamp )
	{
		if ( $timeStamp{ $key } != $i )
		{
			#print "Miss\n" ;
			++$fp ;
		}
	}

	print "TP=$tp FP=$fp\n" ;
	
}
