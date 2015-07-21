#!/bin/perl

#usage: a.pl orig_files hybrid_shrec.fa hybrid_shrec.discard.fa > out

use strict ;

my $line1 ;
my $line2 ;
$line2 = pop @ARGV ;
$line1 = pop @ARGV ;
open FP1, $line1 ;
open FP2, $line2 ;

my @cols1 ;
my @cols2 ;
my $line ;

$line1 = <FP1> ;
chomp $line1 ;
$line2 = <FP2> ;
chomp $line2 ;

@cols1 = split /\s/, $line1 ;
@cols2 = split /\s/, $line2 ;

my $file1Over = 0 ;
my $file2Over = 0 ;

while ( 1 )
{
	last if ( $file1Over && $file2Over ) ;

	if ( ( $file1Over == 0 && $cols1[3] < $cols2[3] ) || $file2Over )
	{
		$line = <> ;
		substr( $line, 0, 1, '>' ) ;
		chomp $line ;
		print $line." oldId=$cols1[3]\n" ;
		$line = <FP1> ;
		print $line ;

		$line = <> ;
		$line = <> ;
		$line = <> ;
		
		$line1 = <FP1> ;
		if ( defined $line1 )
		{
			chomp $line1 ;
			@cols1 = split /\s/, $line1 ;
		}
		else
		{
			$file1Over = 1 ;
		}
	}
	else
	{
		substr( $line, 0, 1, '>' ) ;
		$line = <> ;
		chomp $line ;
		print $line." oldId=$line2\n" ;
		$line = <FP2> ;
		print $line ;

		$line = <> ;
		$line = <> ;
		$line = <> ;
		
		$line2 = <FP2> ;
		if ( defined $line2 )
		{
			chomp $line2 ;
			@cols2 = split /\s/, $line2 ;
		}
		else
		{
			$file2Over = 1 ;
		}
	}
}
