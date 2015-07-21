#!/bin/sh

prog=coral

# 130031312
dataset=geuvadis
cat ~/data/rcorrector/${dataset}/${dataset}_read*.fq > tmp.fq
for k in 23 27 #23 27 31
do
	./coral -k $k -fq tmp.fq -o coral_${dataset}.fq -illumina

	head -130031312 coral_${dataset}.fq > ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	tail -130031312 coral_${dataset}.fq > ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done
rm tmp.fq

dataset=simulate_pair_100M
cat ~/data/rcorrector/simulate/${dataset}_read*.fq > tmp.fq
for k in 23 27 31
do
	./coral -k $k -fq tmp.fq -o coral_${dataset}.fq -illumina

	head -198677432 coral_${dataset}.fq > ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	tail -198677432 coral_${dataset}.fq > ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done
rm tmp.fq

dataset=lung
cat ~/data/rcorrector/${dataset}/${dataset}_read*.fq > tmp.fq
for k in 23 27 31
do
	./coral -k $k -fq tmp.fq -o coral_${dataset}.fq -illumina

	head -226626508 coral_${dataset}.fq > ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	tail -226626508 coral_${dataset}.fq > ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done
rm tmp.fq

# 77766476
cat ~/data/rcorrector/peach_read*.fastq > tmp.fq 
for k in 23 27 31
do
	./coral -k $k -fq tmp.fq -o coral_peach.fq -illumina

	head -77766476 coral_peach.fq > ~/rcorrector/results/${prog}/${prog}_peach_read1_${k}.fq
	tail -77766476 coral_peach.fq > ~/rcorrector/results/${prog}/${prog}_peach_read2_${k}.fq
done
rm coral_peach.fq
rm tmp.fq

for k in 23 27 31
do
	./coral -k $k -fq ~/data/rcorrector/simulate/simulate_60M.fq -o coral_simulate_60M.fq -illumina

	mv coral_simulate_60M.fq ~/rcorrector/results/${prog}/${prog}_simulate_60M_${k}.fq
done
