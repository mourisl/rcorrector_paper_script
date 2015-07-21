#/bin/sh

rm oases_N50.out

for prog in orig seecer hshrec coral musket rcorrector
do
	for ok in 27 33 37
	do
		echo ${prog}_${ok} >> oases_N50.out
		perl ~/Tools/ComputeN50.pl 500 < ${prog}/oases_${ok}/transcripts.fa | grep N50 >> oases_N50.out
	done
done
