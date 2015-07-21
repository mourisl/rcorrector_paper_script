#!/bin/sh

#exit
dataset=geuvadis

prog=orig
cd $prog
for ok in 27 37 47  
do
	../com.oases ${prog}_${dataset}_read1.fq  ${prog}_${dataset}_read2.fq $ok
done
cd ../

prog=seecer
k=23
cd $prog
for ok in 27 37 47 
do
	../com.oases ${prog}_${dataset}_read1_${k}.fa  ${prog}_${dataset}_read2_${k}.fa $ok
done
cd ../

prog=hshrec
cd $prog
for ok in 27 37 47 
do
	../com.oases ${prog}_${dataset}_read1.fa  ${prog}_${dataset}_read2.fa $ok
done
cd ../

prog=coral
k=23
cd $prog
for ok in 27 37 47
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../

prog=musket
k=23
cd $prog
for ok in 27 37 47
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../

prog=rcorrector
k=23
cd $prog
for ok in 27 37 47 
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../
