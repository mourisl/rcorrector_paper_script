#!/bin/sh

dataset=simulate_pair_100M

prog=orig
cd $prog
../com.tophat2 ${prog}_${dataset}_read1.fq ${prog}_${dataset}_read2.fq
mv tophat_out/accepted_hits.bam ${prog}_${dataset}_tophat2.bam
cd ../

prog=perfect
cd $prog
../com.tophat2 ${prog}_${dataset}_read1.fq ${prog}_${dataset}_read2.fq
mv tophat_out/accepted_hits.bam ${prog}_${dataset}_tophat2.bam
cd ../

prog=seecer
k=31
cd $prog
../com.tophat2 ${prog}_${dataset}_read1_${k}.fa ${prog}_${dataset}_read2_${k}.fa
mv tophat_out/accepted_hits.bam ${prog}_${dataset}_${k}_tophat2.bam
cd ../

prog=hshrec
cd $prog
../com.tophat2 ${prog}_${dataset}_read1.fa ${prog}_${dataset}_read2.fa
mv tophat_out/accepted_hits.bam ${prog}_${dataset}_tophat2.bam
cd ../
exit
prog=coral
k=31
cd $prog
../com.tophat2 ${prog}_${dataset}_read1_${k}.fq ${prog}_${dataset}_read2_${k}.fq
mv tophat_out/accepted_hits.bam ${prog}_${dataset}_${k}_tophat2.bam
cd ../

prog=musket
k=27
cd $prog
../com.tophat2 ${prog}_${dataset}_read1_${k}.fq ${prog}_${dataset}_read2_${k}.fq
mv tophat_out/accepted_hits.bam ${prog}_${dataset}_${k}_tophat2.bam
cd ../

prog=rcorrector
k=23
cd $prog
../com.tophat2 ${prog}_${dataset}_read1_${k}.fq ${prog}_${dataset}_read2_${k}.fq
mv tophat_out/accepted_hits.bam ${prog}_${dataset}_${k}_tophat2.bam
cd ../



