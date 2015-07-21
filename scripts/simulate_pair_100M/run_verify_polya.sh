#!/bin/sh

rm summary_polya.out

prog=hshrec
echo "hshrec" >> summary_polya.out
cat $prog/${prog}_simulate_pair_100M_read1_$k.fa $prog/${prog}_simulate_pair_100M_read2_$k.fa | ./verify -exp -polyA 15 >> summary_polya.out

for prog in seecer
do
	for k in 23 27 31
	do
		echo "${prog}_${k}" >> summary_polya.out
		cat $prog/${prog}_simulate_pair_100M_read1_$k.fa $prog/${prog}_simulate_pair_100M_read2_$k.fa | ./verify -exp -polyA 15 >> summary_polya.out
	done
done

for prog in coral musket rcorrector
do
	for k in 23 27 31
	do
		echo "${prog}_${k}" >> summary_polya.out
		cat $prog/${prog}_simulate_pair_100M_read1_$k.fq $prog/${prog}_simulate_pair_100M_read2_$k.fq | ./verify -exp -polyA 15 >> summary_polya.out
	done
done

#for prog in seecer 
#do
#	for k in 23 27 31
#	do
#		echo "${prog}_noindel_${k}" >> summary_polya.out
#		./verify $prog/${prog}_simulate_60M_$k.fq -exp -noindel >> summary_polya.out
#	done
#done

