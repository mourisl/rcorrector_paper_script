#!/bin/sh

dataset=geuvadis
tool=tophat2
rm summd

for prog in seecer rcorrector 
do
	for k in 23 27 31
	do
		echo "$prog $k" >> summd
		samtools view ${prog}/${prog}_${dataset}_${k}_${tool}.bam | perl ~/Tools/SumMD.pl >> summd
	done
done
