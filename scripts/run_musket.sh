#!/bin/sh
prog=musket


dataset=geuvadis
for k in 23 27 #31
do
	./musket -k $k 20000000000 -inorder -omulti musket -p 10 ~/data/rcorrector/${dataset}/${dataset}_read1.fq ~/data/rcorrector/${dataset}/${dataset}_read2.fq
	mv musket.0 ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	mv musket.1 ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done
exit

dataset=simulate_pair_100M
for k in 31 #23 27 31
do
	./musket -k $k 20000000000 -inorder -omulti musket -p 10 ~/data/rcorrector/simulate/${dataset}_read1.fq ~/data/rcorrector/simulate/${dataset}_read2.fq
	mv musket.0 ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq
	mv musket.1 ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq
done
exit



for k in 23 27 31
do
	#perl ./run.pl -t 10 -r ~/data/rcorrector/lung/lung_read1.fq -r ~/data/rcorrector/lung/lung_read2.fq -k $k 
	./musket -k $k 20000000000 -inorder -omulti musket -p 10 ~/data/rcorrector/lung/lung_read1.fq ~/data/rcorrector/lung/lung_read2.fq
	mv musket.0 ~/rcorrector/results/${prog}/${prog}_lung_read1_${k}.fq
	mv musket.1 ~/rcorrector/results/${prog}/${prog}_lung_read2_${k}.fq
done
exit

for k in 23 27 31
do
	./musket -k $k 20000000000 -inorder -omulti musket -p 10 ~/data/rcorrector/peach_read1.fastq ~/data/rcorrector/peach_read2.fastq 
	mv musket.0 ~/rcorrector/results/${prog}/${prog}_peach_read1_${k}.fq
	mv musket.1 ~/rcorrector/results/${prog}/${prog}_peach_read2_${k}.fq
	
done
#exit

for k in 23 27 31
do
	./musket -k $k 20000000000 -inorder -o musket_simulate_60M.cor.fq -p 10 ~/data/rcorrector/simulate/simulate_60M.fq 
	mv musket_simulate_60M.cor.fq ~/rcorrector/results/${prog}/${prog}_simulate_60M_${k}.fq
done
#nohup ./musket -k 23 50000000000 -o musket_simulate_200M.cor.fq -p 10 -inorder ../../data/rcorrector/simulate/simulate_60M.fq &
