#!/bin/sh
prog=rcorrector


dataset=simulate_pair_100M
echo $dataset
for k in 23 27 31
do
	perl ./run_rcorrector.pl -t 10 -p ~/data/rcorrector/simulate/${dataset}_read1.fq ~/data/rcorrector/simulate/${dataset}_read2.fq -k $k 
	mv ${dataset}_read1.cor.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	mv ${dataset}_read2.cor.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done

dataset=peach
echo $dataset
for k in 23 27 31
do
	perl ./run_rcorrector.pl -t 10 -p ~/data/rcorrector/peach_read1.fastq ~/data/rcorrector/peach_read2.fastq -k $k 
	mv peach_read1.cor.fq ~/rcorrector/results/${prog}/${prog}_peach_read1_${k}.fq
	mv peach_read2.cor.fq ~/rcorrector/results/${prog}/${prog}_peach_read2_${k}.fq
done

dataset=ecoli_sc
for k in 19 23 27 31
do
	perl ./run_rcorrector.pl -t 10 -p ~/data/rcorrector/${dataset}/${dataset}_read1.fq  ~/data/rcorrector/${dataset}/${dataset}_read2.fq -k $k 
	mv ${dataset}_read1.cor.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	mv ${dataset}_read2.cor.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done

dataset=geuvadis
echo $dataset
for k in 23 27 31
do
	perl ./run_rcorrector.pl -t 10 -p ~/data/rcorrector/${dataset}/${dataset}_read1.fq  ~/data/rcorrector/${dataset}/${dataset}_read2.fq -k $k 
	mv ${dataset}_read1.cor.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	mv ${dataset}_read2.cor.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done

dataset=lung
echo $dataset
for k in 23 27 31
do
	perl ./run_rcorrector.pl -t 10 -p ~/data/rcorrector/lung/lung_read1.fq ~/data/rcorrector/lung/lung_read2.fq -k $k 
	mv lung_read1.cor.fq ~/rcorrector/results/${prog}/${prog}_lung_read1_${k}.fq
	mv lung_read2.cor.fq ~/rcorrector/results/${prog}/${prog}_lung_read2_${k}.fq
done

