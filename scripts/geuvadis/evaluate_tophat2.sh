#!/bin/sh

suffix="_tophat2" ;
dataset="geuvadis"
rm summd${suffix}
echo "orig" >> summd${suffix}
samtools view orig/orig_${dataset}${suffix}.bam | perl ~/Tools/SumMD.pl >> summd${suffix} 
echo "hshrec" >> summd${suffix}
samtools view hshrec/hshrec_${dataset}${suffix}.bam | perl ~/Tools/SumMD.pl >> summd${suffix} 
for prog in coral musket #seecer rcorrector 
do
	for k in 23 27 31
	do
		echo "$prog $k" >> summd${suffix}
		samtools view ${prog}/${prog}_${dataset}_${k}${suffix}.bam | perl ~/Tools/SumMD.pl >> summd${suffix}
	done
done
