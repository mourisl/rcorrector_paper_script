#!/bin/perl

# Clean the chr id in the polish file from ESTmapper
# usage: a.pl < xxx.gff > yyy.gff

##43:>chr8	sim4db	mRNA	207058	235865	98	+	.	ID=sim4db0;Name=0:>Locus_1_Transcript_1/3_Confidence_0.667_Length_613;Target=0:>Locus_1_Transcript_1/3_Confidence_0.667_Length_613 1 555 -;targetLen=613;pA=0;pT=58;genRegion=149835-580705
#43:>chr8	sim4db	exon	207058	207231	96	+	.	Parent=sim4db0;Target=0:>Locus_1_Transcript_1/3_Confidence_0.667_Length_613 1 174 -;Gap=M174;nMatches=168;intron=->
#43:>chr8	sim4db	exon	213238	213378	98	+	.	Parent=sim4db0;Target=0:>Locus_1_Transcript_1/3_Confidence_0.667_Length_613 175 315 -;Gap=M141;nMatches=139;intron=->

my $coord = 0 ;
my $id ;

while ( <STDIN> )
{
	chomp ;
	s/^[0-9]+:>//g ;
	my $line = $_ ;
	my $pId ;

	my @cols = split /\t+/, $line ;
	
	if ( $cols[2] eq "mRNA" )
	{
		#print $line, "\n" ;
		if ( $line =~ /genRegion=([0-9]+)\-[0-9]+/ )
		{
			#print $1, "\n" ;
			$coord = $1 ;
		}
		else
		{
			die "Wrong format\n" ;
		}
		
		if ( $line =~ /ID=(.+?);/ )
		{
			#print $1, "\n" ;
			$id = $1 ;
		}
		else
		{
			die "Wrong format\n" ;
		}
	}
	elsif ( $cols[2] eq "exon" )
	{
		if ( $line =~ /Parent=(.+?);/ )
		{
			#print $1, "\n" ;
			$pid = $1 ;
		}
		else
		{
			die "Wrong format\n" ;
		}

		die "Unmatched id\n" if ( $pid ne $id ) ;
	
	}
	else
	{
		next ;
	}

	$cols[3] += $coord ;
	$cols[4] += $coord ;
	
	for ( my $i = 0 ; $i < @cols - 1 ; ++$i )
	{
		print $cols[$i], "\t" ;
	}
	print "transcript_id \"$id\"; ", $cols[-1], "\n" ;
}
