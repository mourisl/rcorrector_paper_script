#!/bin/sh

suffix="_tophat2" 
dataset="geuvadis" 

samtools view orig/orig_${dataset}${suffix}.bam | perl ../Tools/ExtractNM.pl | sort -k1 > orig${suffix}.nm

prog=seecer
k=23
echo $prog
samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ../Tools/ExtractNM.pl | sort -k1 > ${prog}.nm
perl ../Tools/CompareNM.pl orig${suffix}.nm ${prog}.nm

prog=hshrec
echo $prog
samtools view ${prog}/${prog}_${dataset}${suffix}.bam | perl ../Tools/ExtractNM.pl | sort -k1 > ${prog}.nm
perl ../Tools/CompareNM.pl orig${suffix}.nm ${prog}.nm

prog=coral
k=23
echo $prog
samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ../Tools/ExtractNM.pl | sort -k1 > ${prog}.nm
perl ../Tools/CompareNM.pl orig${suffix}.nm ${prog}.nm

prog=musket
k=23
echo $prog
samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ../Tools/ExtractNM.pl | sort -k1 > ${prog}.nm
perl ../Tools/CompareNM.pl orig${suffix}.nm ${prog}.nm

prog=bfc
k=23
echo $prog
samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ../Tools/ExtractNM.pl | sort -k1 > ${prog}.nm
perl ../Tools/CompareNM.pl orig${suffix}.nm ${prog}.nm

prog=rcorrector
k=23
echo $prog
samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ../Tools/ExtractNM.pl | sort -k1 > ${prog}.nm
perl ../Tools/CompareNM.pl orig${suffix}.nm ${prog}.nm
