#!/bin/perl

use strict ; 

my $usage = "a.pl xxx.reads < yyy.sam" ;

my %reads ;
open FP1, $ARGV[0] ;

while ( <FP1> )
{
	my @cols = split ;
	$reads{ $cols[0] } = 1 ;
}
close FP1 ;

my $i ;

while ( <> )
{
	my @cols = split ;
#next if ( ( $cols[1] & 0x900 ) != 0 ) ;
#next if ( ( $cols[1] & 0x40 ) == 0 ) ;
#next if ( ($cols[1] & 0x80 ) == 0 ) ;
	print $_ if ( defined $reads{ $cols[0] } ) ;
}
