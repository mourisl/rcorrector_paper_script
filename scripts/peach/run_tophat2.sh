#!/bin/sh

dataset=peach 

for prog in musket coral rcorrector 
do
	cd $prog
	for k in 23 27 31
	do
		../com.tophat2 ${prog}_${dataset}_read1_${k}.fq ${prog}_${dataset}_read2_${k}.fq
		mv tophat_out/accepted_hits.bam ${prog}_${dataset}_${k}_tophat2.bam
	done
	cd ..
done

cd orig
../com.tophat2 orig_${dataset}_read1.fq orig_${dataset}_read2.fq
mv tophat_out/accepted_hits.bam orig_${dataset}_tophat2.bam
cd ../

prog="seecer" 
cd seecer
for k in 23 27 31
do
	../com.tophat2 ${prog}_${dataset}_read1_${k}.fa ${prog}_${dataset}_read2_${k}.fa
	mv tophat_out/accepted_hits.bam ${prog}_${dataset}_${k}_tophat2.bam
done
cd ../

cd hshrec
../com.tophat2 hshrec_${dataset}_read1.fa hshrec_${dataset}_read2.fa
mv tophat_out/accepted_hits.bam hshrec_${dataset}_tophat2.bam
cd ../
