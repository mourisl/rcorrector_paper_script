#!/bin/sh

suffix="_tophat2" 
dataset="lung" 

samtools view orig/orig_${dataset}${suffix}.bam | perl ../Tools/GetPerfectMates.pl > perfect_mates_tophat2.id

prog=orig
echo $prog
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read1.fq > tmp1.reads
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read2.fq > tmp2.reads
perl ../Tools/MergeOneLineReads.pl tmp1.reads tmp2.reads | sort > perfect_mates

prog=seecer
k=23
echo $prog
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read1_${k}.fa -fa > tmp1.reads
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read2_${k}.fa -fa > tmp2.reads
perl ../Tools/MergeOneLineReads.pl tmp1.reads tmp2.reads | sort > tmp.reads
perl ../Tools/CompareOneLineReads.pl perfect_mates tmp.reads

prog=hshrec
echo $prog
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read1.fa -fa > tmp1.reads
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read2.fa -fa > tmp2.reads
perl ../Tools/MergeOneLineReads.pl tmp1.reads tmp2.reads | sort > tmp.reads
perl ../Tools/CompareOneLineReads.pl perfect_mates tmp.reads


prog=coral
k=23
echo $prog
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read1_${k}.fq > tmp1.reads
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read2_${k}.fq > tmp2.reads
perl ../Tools/MergeOneLineReads.pl tmp1.reads tmp2.reads | sort > tmp.reads
perl ../Tools/CompareOneLineReads.pl perfect_mates tmp.reads

prog=musket
k=27
echo $prog
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read1_${k}.fq > tmp1.reads
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read2_${k}.fq > tmp2.reads
perl ../Tools/MergeOneLineReads.pl tmp1.reads tmp2.reads | sort > tmp.reads
perl ../Tools/CompareOneLineReads.pl perfect_mates tmp.reads

prog=rcorrector
k=23
echo $prog
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read1_${k}.fq > tmp1.reads
perl ../Tools/ExtractOnelineReads.pl perfect_mates_tophat2.id ${prog}/${prog}_${dataset}_read2_${k}.fq > tmp2.reads
perl ../Tools/MergeOneLineReads.pl tmp1.reads tmp2.reads | sort > tmp.reads
perl ../Tools/CompareOneLineReads.pl perfect_mates tmp.reads

