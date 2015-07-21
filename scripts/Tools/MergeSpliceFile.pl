#!/bin/perl

use strict ;

die "perl a.pl base.splice other_splice_files\n" if ( @ARGV == 0 ) ;

my %splice ;

open FP1, $ARGV[0] ;

while ( <FP1> )
{
	my @cols = split ;
	my $key = $cols[0]." ".$cols[1]." ".$cols[2]." ".$cols[4] ;
	$splice{ $key } = $cols[5] ;
}
close FP1 ;

my $i ;
for ( $i = 1 ; $i < @ARGV ; ++$i )
{
	open FP1, $ARGV[ $i ] ;
	while ( <FP1> )
	{
		my @cols = split ;
		my $key = $cols[0]." ".$cols[1]." ".$cols[2]." ".$cols[4] ;
		next if ( !( defined $splice{ $key } ) ) ;
		my $val = $splice{$key} ;
		my $cnt = scalar( split /\s/, $val ) ;
		for ( my $j = $cnt ; $j < $i ; ++$j )
		{
			$val = $val." 0" ;
		}
		$splice{ $key } = $val." ".$cols[5] ;
	}
	close FP1 ;
}

foreach my $key ( keys %splice ) 
{
	my $val = $splice{$key} ;
	my $cnt = scalar( split /\s/, $val ) ;
	for ( my $j = $cnt ; $j < $i ; ++$j )
	{
		$val = $val." 0" ;
	}
	print $val, "\n" ;
}
