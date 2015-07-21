#!/bin/sh
prog=seecer

dataset=ecoli_sc
for k in 19 23 27 31
do
	./run_seecer.sh -t jf_tmp -k $k -j /home/lsong/rcorrector/SEECER-0.1.3/jellyfish-1.1.11/bin/jellyfish ${dataset}_read1.fq ${dataset}_read2.fq
	mv ${dataset}_read1.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fa
	mv ${dataset}_read2.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fa
done

dataset=geuvadis
for k in 23 27 31
do
	./run_seecer.sh -t jf_tmp -k $k -j /home/lsong/rcorrector/SEECER-0.1.3/jellyfish-1.1.11/bin/jellyfish ${dataset}_read1.fq ${dataset}_read2.fq
	mv ${dataset}_read1.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fa
	mv ${dataset}_read2.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fa
done

dataset=simulate_pair_100M
for k in 23 27 31
do
	./run_seecer.sh -t jf_tmp -k $k -j /home/lsong/rcorrector/SEECER-0.1.3/jellyfish-1.1.11/bin/jellyfish ${dataset}_read1.fq ${dataset}_read2.fq
	mv ${dataset}_read1.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fa
	mv ${dataset}_read2.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fa
done

dataset=lung
for k in 23 27 31
do
	./run_seecer.sh -t jf_tmp -k $k -j /home/lsong/rcorrector/SEECER-0.1.3/jellyfish-1.1.11/bin/jellyfish lung_read1.fq lung_read2.fq

	mv lung_read1.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_lung_read1_${k}.fa
	mv lung_read2.fq_corrected.fa ~/rcorrector/results/${prog}/${prog}_lung_read2_${k}.fa
done

dataset=peach
for k in 23 27 31
do
	./run_seecer.sh -t jf_tmp -k $k -j /home/lsong/rcorrector/SEECER-0.1.3/jellyfish-1.1.11/bin/jellyfish peach_read1.fastq peach_read2.fastq

	mv peach_read1.fastq_corrected.fa ~/rcorrector/results/${prog}/${prog}_peach_read1_${k}.fa
	mv peach_read2.fastq_corrected.fa ~/rcorrector/results/${prog}/${prog}_peach_read2_${k}.fa
done

