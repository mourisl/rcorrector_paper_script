#!/bin/perl

# Assume a.reads and b.reads contain the same reads

my $usage = "perl a.pl a.reads b.reads" ; 

open FP1, $ARGV[0] ;
open FP2, $ARGV[1] ;

while ( <FP1> )
{
	chomp ;
	print $_, " " ;
	my $line = <FP2> ;
	chomp $line ;
	my @cols = split /\s/, $line ;
	print $cols[1], "\n" ;
}
