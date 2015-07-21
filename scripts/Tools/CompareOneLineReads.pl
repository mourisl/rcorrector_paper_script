#!/bin/perl

use strict ;

my $usage = "a.pl a.reads b.reads" ;

open FP1, $ARGV[0] ;
open FP2, $ARGV[1] ;

my $match = 0  ;
my $cnt ;
while ( <FP1> )
{
	my $line1 = $_ ;
	my $line2 = <FP2> ;
	
	die "Need sort\n" if ( ( split /\s/, $line1)[0] ne ( split /\s/, $line2)[0] ) ;

	++$match if ( $line1 eq $line2 ) ;
	++$cnt ;
}
print "$match $cnt ", $match / $cnt * 100.0, "\n" ;
