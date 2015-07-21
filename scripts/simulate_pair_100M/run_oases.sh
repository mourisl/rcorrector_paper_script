#!/bin/sh

#exit
dataset=simulate_pair_100M

#prog=orig
#k=27
#cd $prog
#sh ../com.oases ${prog}_${dataset}_read1.fq ${prog}_${dataset}_read2.fq
#cd ../
prog=orig
cd $prog
for ok in 57 #63 67 73 77
do
	../com.oases ${prog}_${dataset}_read1.fq  ${prog}_${dataset}_read2.fq $ok
done
cd ../

prog=seecer
k=27
cd $prog
for ok in 57 #63 67 73 77
do
	../com.oases ${prog}_${dataset}_read1_${k}.fa  ${prog}_${dataset}_read2_${k}.fa $ok
done
cd ../

prog=hshrec
cd $prog
for ok in 57 #63 67 73 77
do
	../com.oases ${prog}_${dataset}_read1.fa  ${prog}_${dataset}_read2.fa $ok
done
cd ../
exit

prog=coral
k=31
cd $prog
for ok in 57 #63 67 73 77
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../

prog=musket
k=27
cd $prog
for ok in 57 #63 67 73 77
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../

prog=rcorrector
k=27
cd $prog
for ok in 57 #63 67 73 77
do
	../com.oases ${prog}_${dataset}_read1_${k}.fq  ${prog}_${dataset}_read2_${k}.fq $ok
done
cd ../


