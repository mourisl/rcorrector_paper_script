#!/bin/sh

#perl PutbackId.pl peach_read1.fa peach_read1.fa.corrected peach_read1.fa.discarded > ~/rcorrector/results/hshrec/hshrec_peach_read1.fa
#perl PutbackId.pl peach_read2.fa peach_read2.fa.corrected peach_read2.fa.discarded > ~/rcorrector/results/hshrec/hshrec_peach_read2.fa
#exit

dataset=geuvadis
perl Fq2Fa.pl ~/data/rcorrector/${dataset}/${dataset}_read1.fq > ${dataset}_read1.fa
perl Fq2Fa.pl ~/data/rcorrector/${dataset}/${dataset}_read2.fq > ${dataset}_read2.fa
java Shrec -n 300000000 -s 3 ${dataset}_read1.fa ${dataset}_read2.fa 
perl PutbackId.pl ${dataset}_read1.fa ${dataset}_read1.fa.corrected ${dataset}_read1.fa.discarded > ~/rcorrector/results/hshrec/hshrec_${dataset}_read1.fa
perl PutbackId.pl ${dataset}_read2.fa ${dataset}_read2.fa.corrected ${dataset}_read2.fa.discarded > ~/rcorrector/results/hshrec/hshrec_${dataset}_read2.fa
rm ${dataset}_read*

dataset=simulate_pair_100M
perl Fq2Fa.pl ~/data/rcorrector/simulate/${dataset}_read1.fq > ${dataset}_read1.fa
perl Fq2Fa.pl ~/data/rcorrector/simulate/${dataset}_read2.fq > ${dataset}_read2.fa
java Shrec -n 300000000 -s 3 ${dataset}_read1.fa ${dataset}_read2.fa 
perl PutbackId.pl ${dataset}_read1.fa ${dataset}_read1.fa.corrected ${dataset}_read1.fa.discarded > ~/rcorrector/results/hshrec/hshrec_${dataset}_read1.fa
perl PutbackId.pl ${dataset}_read2.fa ${dataset}_read2.fa.corrected ${dataset}_read2.fa.discarded > ~/rcorrector/results/hshrec/hshrec_${dataset}_read2.fa
rm ${dataset}_read*

dataset=lung
perl Fq2Fa.pl ~/data/rcorrector/${dataset}/${dataset}_read1.fq > ${dataset}_read1.fa
perl Fq2Fa.pl ~/data/rcorrector/${dataset}/${dataset}_read2.fq > ${dataset}_read2.fa
java Shrec -n 300000000 -s 3 ${dataset}_read1.fa ${dataset}_read2.fa 
perl PutbackId.pl ${dataset}_read1.fa ${dataset}_read1.fa.corrected ${dataset}_read1.fa.discarded > ~/rcorrector/results/hshrec/hshrec_${dataset}_read1.fa
perl PutbackId.pl ${dataset}_read2.fa ${dataset}_read2.fa.corrected ${dataset}_read2.fa.discarded > ~/rcorrector/results/hshrec/hshrec_${dataset}_read2.fa
rm ${dataset}_read*

perl Fq2Fa.pl ~/data/rcorrector/peach_read1.fastq > peach_read1.fa
perl Fq2Fa.pl ~/data/rcorrector/peach_read2.fastq > peach_read2.fa
java Shrec -n 300000000 -s 3 peach_read1.fa peach_read2.fa 
perl PutbackId.pl peach_read1.fa peach_read1.fa.corrected peach_read1.fa.discarded > ~/rcorrector/results/hshrec/hshrec_peach_read1.fa
perl PutbackId.pl peach_read2.fa peach_read2.fa.corrected peach_read2.fa.discarded > ~/rcorrector/results/hshrec/hshrec_peach_read2.fa
rm peach_read*

