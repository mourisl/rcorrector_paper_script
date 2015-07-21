#!/bin/sh

#ANNOT=/home/lsong/data/peach/Prunus_persica_v1.0_genes.gtf
ANNOT=/home/lsong/data/peach/peach.gtf

rm ESTmapper_eval.out
for prog in orig seecer hshrec coral musket rcorrector
do
	echo $prog >> ESTmapper_eval.out
	convertPolishes < ${prog}/ESTmapper_dir/polishes-best | perl ../Tools/ConvertPolishGff.pl > tmp.gtf
	grader $ANNOT tmp.gtf -ac >> ESTmapper_eval.out
done
