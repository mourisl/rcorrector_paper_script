#!/bin/sh

rm summary.out

#echo "hshrec" >> summary.out
#./verify hshrec/hshrec_simulate_60M_23.fq -exp >> summary.out

prog=spades
echo "spades" >> summary.out
cat $prog/${prog}_simulate_pair_100M_read1.fq $prog/${prog}_simulate_pair_100M_read2.fq | ./verify -exp -trim >> summary.out

for prog in seecer
do
	for k in 23 27 31
	do
		echo "${prog}_${k}" >> summary.out
		cat $prog/${prog}_simulate_pair_100M_read1_$k.fa $prog/${prog}_simulate_pair_100M_read2_$k.fa | ./verify -exp >> summary.out
	done
done

for prog in coral musket rcorrector
do
	for k in 23 27 31
	do
		echo "${prog}_${k}" >> summary.out
		cat $prog/${prog}_simulate_pair_100M_read1_$k.fq $prog/${prog}_simulate_pair_100M_read2_$k.fq | ./verify -exp >> summary.out
	done
done

#for prog in seecer 
#do
#	for k in 23 27 31
#	do
#		echo "${prog}_noindel_${k}" >> summary.out
#		./verify $prog/${prog}_simulate_60M_$k.fq -exp -noindel >> summary.out
#	done
#done
