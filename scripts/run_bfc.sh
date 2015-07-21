#!/bin/bash
prog=bfc

dataset=simulate_pair_100M
for k in 23 27 31
do
	./bfc -t 10 -s 3g -k $k <(seqtk mergepe ~/data/rcorrector/simulate/${dataset}_read1.fq ~/data/rcorrector/simulate/${dataset}_read2.fq) <(seqtk mergepe ~/data/rcorrector/simulate/${dataset}_read1.fq ~/data/rcorrector/simulate/${dataset}_read2.fq) > bfc_out.fq
	perl SplitFq.pl ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq < bfc_out.fq
done

dataset=peach
for k in 23 27 31
do
	./bfc -t 10 -s 3g -k $k <(seqtk mergepe ~/data/rcorrector/${dataset}/${dataset}_read1.fq ~/data/rcorrector/${dataset}/${dataset}_read2.fq) <(seqtk mergepe ~/data/rcorrector/${dataset}/${dataset}_read1.fq ~/data/rcorrector/${dataset}/${dataset}_read2.fq) > bfc_out.fq
	perl SplitFq.pl ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq < bfc_out.fq
done


dataset=lung
for k in 23 27 31
do
	./bfc -t 10 -s 3g -k $k <(seqtk mergepe ~/data/rcorrector/${dataset}/${dataset}_read1.fq ~/data/rcorrector/${dataset}/${dataset}_read2.fq) <(seqtk mergepe ~/data/rcorrector/${dataset}/${dataset}_read1.fq ~/data/rcorrector/${dataset}/${dataset}_read2.fq) > bfc_out.fq
	perl SplitFq.pl ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq < bfc_out.fq
done

dataset=geuvadis
for k in 23 27 31
do
	./bfc -t 10 -s 3g -k $k <(seqtk mergepe ~/data/rcorrector/${dataset}/${dataset}_read1.fq ~/data/rcorrector/${dataset}/${dataset}_read2.fq) <(seqtk mergepe ~/data/rcorrector/${dataset}/${dataset}_read1.fq ~/data/rcorrector/${dataset}/${dataset}_read2.fq) > bfc_out.fq
	perl SplitFq.pl ~/rcorrector/results/${prog}/${prog}_${dataset}_read1_${k}.fq ~/rcorrector/results/${prog}/${prog}_${dataset}_read2_${k}.fq < bfc_out.fq
done
