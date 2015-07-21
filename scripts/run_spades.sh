#!/bin/sh

dataset=ecoli_sc

prog=orig
cd $prog
spades.py --only-assembler --sc -1 ${prog}_${dataset}_read1.fq -2 ${prog}_${dataset}_read2.fq -t 8 -o ${prog}_spades_out
cd ../

prog=spades
cd $prog
spades.py --only-assembler --sc -1 ${prog}_${dataset}_read1.fq -2 ${prog}_${dataset}_read2.fq -t 8 -o ${prog}_spades_out
cd ../

exit

prog=seecer
cd $prog
spades.py --only-assembler --sc -1 ${prog}_${dataset}_read1.fa -2 ${prog}_${dataset}_read2.fa -t 8 -o ${prog}_spades_out
cd ../

prog=rcorrector
cd $prog
spades.py --only-assembler --sc -1 ${prog}_${dataset}_read1.fq -2 ${prog}_${dataset}_read2.fq -t 8 -o ${prog}_spades_out
cd ../
