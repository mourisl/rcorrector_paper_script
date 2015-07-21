rm summd
dataset=simulate_pair_100M
for i in `ls */*${dataset}*.bam`
do
	#echo $i
	echo $i >> summd
	samtools view $i | perl ~/Tools/SumMD.pl >> summd 
done
