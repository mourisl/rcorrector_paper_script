#!/bin/sh

dataset=peach

prog=rcorrector
k=23
echo $prog
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read1_${k}.fq > tmp1.reads
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read2_${k}.fq > tmp2.reads
perl ../Tools/MergeOneLineReads.pl tmp1.reads tmp2.reads | sort > tmp.reads
perl ../Tools/CompareOneLineReads.pl perfect_mates tmp.reads
exit


suffix="_tophat2" ;
suffix2="_rcorrector_tophat2" ;
for prog in rcorrector 
do
	for k in 23 27 31
	do
		echo "$prog $k" >> summd${suffix2}
		samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ~/Tools/SumMD.pl >> summd${suffix2}
	done
done
exit

for prog in rcorrector 
do
	cd $prog
	for k in 23 27 31
	do
		../com.tophat2 ${prog}_${dataset}_read1_${k}.fq ${prog}_${dataset}_read2_${k}.fq
		mv tophat_out/accepted_hits.bam ${prog}_${dataset}_${k}_tophat2.bam
	done
	cd ..
done

suffix="_tophat2" ;
suffix2="_rcorrector_tophat2" ;
for prog in rcorrector 
do
	for k in 23 27 31
	do
		echo "$prog $k" >> summd${suffix}
		samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ~/Tools/SumMD.pl >> summd${suffix}
	done
done
