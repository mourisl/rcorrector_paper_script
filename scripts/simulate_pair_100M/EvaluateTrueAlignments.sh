#!/bin/sh

samtools view orig/orig_simulate_pair_100M_tophat2.bam | perl ../Tools/EvaluateTrueAlignments.pl trueAlignment.out > evaluate_ta.out
samtools view seecer/seecer_simulate_pair_100M_31_tophat2.bam | perl ../Tools/EvaluateTrueAlignments.pl trueAlignment.out >> evaluate_ta.out
samtools view hshrec/hshrec_simulate_pair_100M_tophat2.bam | perl ../Tools/EvaluateTrueAlignments.pl trueAlignment.out >> evaluate_ta.out
samtools view coral/coral_simulate_pair_100M_31_tophat2.bam | perl ../Tools/EvaluateTrueAlignments.pl trueAlignment.out >> evaluate_ta.out
samtools view musket/musket_simulate_pair_100M_27_tophat2.bam | perl ../Tools/EvaluateTrueAlignments.pl trueAlignment.out >> evaluate_ta.out
samtools view rcorrector/rcorrector_simulate_pair_100M_27_tophat2.bam | perl ../Tools/EvaluateTrueAlignments.pl trueAlignment.out >> evaluate_ta.out

