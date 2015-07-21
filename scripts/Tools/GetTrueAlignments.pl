#!/bin/perl

# usage: a.pl xxx.fa > out.range

#@Id_29831467 Part2.fastq.019664218 contig=chr20:277737-280965W:ENST00000382352.3:2:3229:2670:2892:S/2 haplotype=0 length=100 orig_begin=0 orig_end=100 haplotype_infix=AATCACCTGGAGGAGGGAGCAGAAAGAGAAGGTTTTTAAGGAGGGGCTTCTGAATACTTGGGAGATACGGAACGGACCAAGGACCACACTCCAGGGTGCA edit_string=MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM strand=forward exp=low
while ( <> )
{
	chomp ;
	$line = $_ ;
	my @cols = split /\s/ ;
	my $readId = ( split /_/, $cols[0] )[1] ;
	if ( $cols[2] =~ /contig=(.*)/ )
	{
		my $contig = $1 ;
		#print $1, "\n";
		my @cols = split /:/, $contig ;
		my $chr = $cols[0] ;
		my @coords = split /-/, substr( $cols[1], 0, length( $cols[1] ) - 1 ) ;
		#die "Exon and range are not compatible. $line\n" if ( $start == 0 || $end == 0 ) ;
		my $start = $coords[0] ;
		my $end = $coords[1] ;
		print "$readId $chr $start $end\n" ;
	}
	else
	{
		die "Unknown format. $line\n" ;
	}

	$line = <> ;
	$line = <> ;
	$line = <> ;
}

