#!/bin/perl

use strict ;

# usage: print "a.pl < ssd.out"

my %support ;
my %supportCnt ;

while ( <> )
{
	my @cols = split ;
	my $key = $cols[0] ;
	my $i ;
	my @cols2 = split /\s/, ( $support{ $key } ) ;
	for ( $i = 0 ; $i < @cols ; ++$i )
	{
		$cols2[ $i ] += $cols[ $i ] ;
	}
	
	my $val ;
	for ( $i = 0 ; $i < @cols - 1 ; ++$i )
	{
		$val .= $cols2[$i]." " ;
	}
	$val .= $cols2[$i] ;

	$support{ $key } = $val ;
	++$supportCnt{ $key } ;
}

for my $key (sort {$a<=>$b} (keys %support) )
{
	my @cols = split /\s/, $support{$key} ;
	my $i ;
	for ( $i = 0 ; $i < @cols ; ++$i )
	{
		$cols[$i] /= $supportCnt{ $key } ;
		print $cols[$i], " " ; 
	}
	print "\n" ;
}
