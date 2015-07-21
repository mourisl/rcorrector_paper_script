#!/bin/perl

use strict ;

die "usage: a.pl xxx.range < yyy.sam" if ( @ARGV == 0 ) ;

open FP1, $ARGV[0] ;
my @starts ;
my @ends ;
my @chrs ;

my $totalCnt = 0 ;
my $trueAlignCnt = 0 ;

while ( <FP1> )
{
	my @cols = split ;
	$chrs[$cols[0] ] = $cols[1] ;
	$starts[ $cols[0] ] = $cols[2] ;
	$ends[ $cols[0] ] = $cols[3] ;
}

#Id_15908142	329	chr1	13489	3	100M	*	0	0	ACACCACTGCCTGGCGCTGTGCCCTTCCTTTGCTCTGCCCGCTGGAGACGGTGTTTGTCATGGGCCTGGTCTGCAGGGATCCTGCTACAAAGGTGAAACC	FCCEB@BIIFB><<FAAGGAE4;H<>AC47A>?185>58C<9=:6C0@L92<08.:3:2C:/,/14;7*,6455,8B2&1-<4!6@4&*-3=86)0!2!*	AS:i:-5	XN:i:0	XM:i:1	XO:i:0	XG:i:0	NM:i:1	MD:Z:0G99	YT:Z:UU	NH:i:2	CC:Z:chr2	CP:i:114357428	HI:i:0
while ( <STDIN> )
{
	my @cols = split ;
	next if ( ( $cols[1] & 0x900 ) != 0 ) ;
	++$totalCnt ;
	my $id = ( split /_/, $cols[0] )[1] ;
	
	my $pos = $cols[3] ;
	next if ( $cols[2] ne $chrs[ $id ] ) ;
	next if ( $pos < $starts[ $id ] - 10 || $pos > $ends[ $id ] + 10 ) ;
	++$trueAlignCnt ;
}

print "total= ", $totalCnt, " true= ", $trueAlignCnt, "\n" ;
