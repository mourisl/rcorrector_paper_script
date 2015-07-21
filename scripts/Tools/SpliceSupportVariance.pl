#!/bin/perl

use strict ;

die "a.pl perfect.splice test.splice\n" if ( @ARGV == 0 ) ;

open FP1, $ARGV[0] ;
open FP2, $ARGV[1] ;

my %support ;

while ( <FP2> )
{
	my @cols = split ;
	my $key = $cols[0]."_".$cols[1]."_".$cols[2]."_".$cols[4] ;
	$support{ $key } = $cols[5] ;
}

my $cnt = 0 ;
my $sum = 0 ;
while ( <FP1> )
{
	my @cols = split ;
	my $key = $cols[0]."_".$cols[1]."_".$cols[2]."_".$cols[4] ;
	my $tmp = $support{ $key } ;

	next if ( $cols[5] < 0 ) ;
	++$cnt ;
	$sum += abs( $cols[5] - $tmp )  ;
}

print $sum / $cnt, "\n" ;
