#!/bin/sh

#exit

export OMP_THREAD_LIMIT=16
export OMP_NUM_THREADS=10

velveth peach_oases 31 -fastq -separate -shortPaired peach_read1.cor.fq peach_read2.cor.fq
velvetg peach_oases -read_trkg yes
oases peach_oases
