#!/bin/sh

ANNOT=/home/lsong/data/gencode+refseq.annotation.gtf

rm ESTmapper_eval.out
for prog in orig seecer hshrec coral musket rcorrector
do
	echo $prog >> ESTmapper_eval.out
	convertPolishes < ${prog}/ESTmapper_dir/polishes-best | perl ../Tools/ConvertPolishGff.pl > tmp.gtf
	grader $ANNOT tmp.gtf >> ESTmapper_eval.out
done
