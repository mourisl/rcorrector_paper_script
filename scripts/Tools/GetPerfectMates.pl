#!/bin/perl

# Extract the id of the perfect mates and their position

use strict ;

my %reads ;
my $L = 100000;

sub IsConcordance
{
	if ( !( $_[0] =~ /^(\S+)\t(\S+)\t(\S+)\t\S+\t\S+\t\S+\t(\S+)\t\S+\t(\S+)\t\S+\t/ ) )
	{
		die "died. ", $_[0] ;
	}
	my ($readid,$flag,$chrom,$mate_chrom,$isize) = ($1,$2,$3,$4,$5);

	next if (($chrom eq "*") || ($flag & 0x40) == ($flag & 0x80));

	my $idx  = ($flag & 0x40) ? 1 : 2;
	my $ori1 = ($flag & 0x10) ? "R" : "F";
	my $ori2 = ($flag & 0x20) ? "R" : "F";

	next if ($ori1 eq $ori2);

	if ($idx==1) {
		if (($ori1 eq "F") && (0<=$isize && $isize<=$L)) { return 1 ; }
		if (($ori1 eq "R") && (-$L<=$isize && $isize<=0)) { return 1 ; }
	} elsif ($idx==2) {
		if (($ori1 eq "F") && (0<=$isize && $isize<=$L)) { return 1 ; }
		if (($ori1 eq "R") && (-$L<=$isize && $isize<=0)) { return 1 ; }
	} else {
		die "unrecognized index. $idx\n";
	}
	return 0 ;
}

while ( <> )
{
	my $line = $_ ;
	next if ( /^@/ ) ;
	# Test concordance
	next if ( IsConcordance( $line ) == 0 ) ;

	my @cols = split /\s+/, $line ;
	next if ( ( $cols[1] & 0x900 ) != 0 ) ;

	my $id = $cols[0] ;
	my $pos = $cols[3] ;
	if ( /MD:Z:(.+?)\s/ )
	{
		#print $1, "\n" ;
		my $len = length( $cols[9] ) ;
		my $sum1 = $1 ;
		next if ( $sum1 ne $len ) ;

		if ( defined $reads{ $id } )
		{
			my $r = $reads{ $id } ;
			my $val ;
			if ( $r < $pos )
			{
				$val = $r." ".$pos ;
			}
			else
			{
				$val = $pos." ".$r ;
			}
			$reads{ $id } = $val ;
		}
		else
		{
			$reads{ $id } = $pos ;
		}
	}
}

foreach my $key (keys %reads)
{
	my @cols = split /\s/, $reads{ $key } ;	
#print $key, " ", $cols[0], " ", $cols[1], "\n" ;
	next if ( scalar( @cols ) < 2 ) ;
	print $key, " ", $cols[0], " ", $cols[1], "\n" ;
} 
