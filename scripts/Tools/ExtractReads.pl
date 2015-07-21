#!/bin/perl

use strict ; 

my $usage = "a.pl xxx.reads samfile_list" ;

my %reads ;
open FP1, $ARGV[0] ;

while ( <FP1> )
{
	my @cols = split ;
	$reads{ $cols[0] } = 1 ;
}
close FP1 ;

my $i ;

for ( $i = 1 ; $i < scalar( @ARGV ) ; ++$i )
{
	open FP1, $ARGV[$i] ;
	my $fileName = $ARGV[$i]."_reads" ;
	open FPout, ">$fileName" ;
	while ( <FP1> )
	{
		my @cols = split ;
		#next if ( ( $cols[1] & 0x900 ) != 0 ) ;
		#next if ( ( $cols[1] & 0x40 ) == 0 ) ;
		#next if ( ($cols[1] & 0x80 ) == 0 ) ;
		print FPout $_ if ( defined $reads{ $cols[0] } ) ;
	}
	close FPout ;
	close FP1 ;
}
