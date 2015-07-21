#!/bin/perl

# Extract the id of the perfect mates and their position

use strict ;

my %reads ;

while ( <> )
{
	my @cols = split ;
	next if ( ( $cols[1] & 0x900 ) != 0 ) ;
	my $id = $cols[0] ;
	my $pos = $cols[3] ;
	if ( /MD:Z:(.+?)\s/ )
	{
		#print $1, "\n" ;
		my $len = length( $cols[9] ) ;
		my $sum1 = $1 ;
		next if ( $sum1 ne $len ) ;
		print $id, "\n" ;
	}
}
