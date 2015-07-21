#!/bin/sh

#exit
dataset=simulate_pair_100M

prog=rcorrector_rev
k=27
cd $prog
~/Softwares/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 100G --left ${prog}_${dataset}_read1_${k}.fq --right ${prog}_${dataset}_read2_${k}.fq --CPU 6
cd ../
exit

prog=orig
cd $prog
~/Softwares/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 100G --left ${prog}_${dataset}_read1.fq --right ${prog}_${dataset}_read2.fq --CPU 6
cd ../

prog=seecer
k=31
cd $prog
~/Softwares/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 100G --left ${prog}_${dataset}_read1_${k}.fa --right ${prog}_${dataset}_read2_${k}.fa --CPU 6
cd ../

prog=hshrec
cd $prog
~/Softwares/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 100G --left ${prog}_${dataset}_read1.fa --right ${prog}_${dataset}_read2.fa --CPU 6
cd ../

prog=coral
k=31
cd $prog
~/Softwares/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 100G --left ${prog}_${dataset}_read1_${k}.fq --right ${prog}_${dataset}_read2_${k}.fq --CPU 6
cd ../

prog=musket
k=27
cd $prog
~/Softwares/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 100G --left ${prog}_${dataset}_read1_${k}.fq --right ${prog}_${dataset}_read2_${k}.fq --CPU 6
cd ../

prog=bfc
k=31
cd $prog
~/Softwares/trinityrnaseq-2.0.6/Trinity --seqType fq --max_memory 100G --left ${prog}_${dataset}_read1_${k}.fq --right ${prog}_${dataset}_read2_${k}.fq --CPU 6
cd ../



