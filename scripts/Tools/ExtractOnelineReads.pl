#!/bin/perl

# a.pl xxx.reads yyy.fq [-fa]
my %reads ;
open FP1, $ARGV[0] ;

my $isFA = 0 ;
if ( $ARGV[2] eq "-fa" )
{
	$isFA = 1 ;
}

while (<FP1>)
{
	my @cols = split ;
	$reads{$cols[0]} = 1 ;
}
close FP1 ;

open FP1, $ARGV[1] ;
while (<FP1>)
{
	my $line = $_ ;
	chomp $line ;
	my $id = ( split /\s/, substr( $line, 1 ) )[0] ;
	if ( defined $reads{$id} )
	{
		print "$id " ;
		$line = <FP1> ;
		print "$line" ;

		if ( $isFA == 0 )
		{
			$line = <FP1> ;
			$line = <FP1> ;
		}
	}
	else
	{
		$line = <FP1> ;

		if ( $isFA == 0 )
		{
			$line = <FP1> ;
			$line = <FP1> ;
		}
	}
}
