#!/bin/sh

#exit
dataset=peach

prog=orig
cd $prog
for ok in 25 #23 27 #33 #37 43 #47 #53 57 63 67 73
do
	../com.oases ${prog}_${dataset}_read1.fq  ${prog}_${dataset}_read2.fq $ok
done
cd ../

prog=seecer
k=27
cd $prog
for ok in 25 #33 #37 43 #47 #53 57 63 67 73
do
	../com.oases ${prog}_${dataset}_read1_${k}.fa  ${prog}_${dataset}_read2_${k}.fa $ok
done
cd ../

prog=hshrec
cd $prog
for ok in 25 #33 #37 43  #53 57 63 67 73
do
	../com.oases ${prog}_${dataset}_read1.fa  ${prog}_${dataset}_read2.fa $ok
done
cd ../

prog=coral
k=23
cd $prog
for ok in 25 #33 #37 43 #53 57 63 67 73
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../

prog=musket
k=27
cd $prog
for ok in 25 #33 #37 43 #53 57 63 67 73
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../

prog=rcorrector
k=23
cd $prog
for ok in 25 #33 #37 43 #53 57 63 67 73
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../
