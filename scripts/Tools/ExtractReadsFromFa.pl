#!/bin/perl

# a.pl xxx.reads.sam yyy.fa
my %reads ;
open FP1, $ARGV[0] ;

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
		print "$line\n" ;
		$line = <FP1> ;
		print "$line" ;
	}
	else
	{
		$line = <FP1> ;
	}
}
