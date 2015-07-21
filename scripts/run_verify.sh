#!/bin/sh

rm summary.out

echo "hshrec" >> summary.out
./verify hshrec/hshrec_simulate_60M_23.fq -exp >> summary.out

for prog in seecer coral soapec musket rcorrector
do
	for k in 23 27 31
	do
		echo "${prog}_${k}" >> summary.out
		./verify $prog/${prog}_simulate_60M_$k.fq -exp >> summary.out
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
