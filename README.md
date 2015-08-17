 rcorrector_paper

#scripts:
You can find the scripts used in the evaluation in the subdirectory "scripts".

In the manuscript, we have 4 data sets, the scripts for them are in the subdirectories "simulate_pair_100M", "peach", "lung", "geuvadis". 

For each data set, to run each error corrector, you can go into the corresponding data set directory and execute run_"tools_name".sh . For example, if you want to run rcorrector, you can run "sh run_rcorrector.sh". You may need to change some paths in the shell script.

### simulated data set
To append the "exp=xxx" tag in the simulated data set, you can run:
"perl ../Tools/AddExpLevel.pl mason_read1.fq pro_file_from_fluxsimulator.pro> simulated_pair_100M_read1.fq" and also for the other mate pair read file 

To evaluate the accuracy on the simulated data set, you need to compile the code in MasonVerify by "g++ -o verify verify.cpp". And the "run_verify.sh" script will output the accuracy for each setting. 

### Tophat2, Bowtie2, Oases, SPAdes
For those programs, you can execute the script run_"program_name".sh .

### Perfect alignment and false positive 
The code to obtain the perfect alignments and compute the false positive rate are contained in "scripts/${data_set}/evaluate_tophat2_FP.sh"

### Memory usage
We use the program "memusage" to evaluate the memory usage of programs. It is downloaded from [musket repository](https://sourceforge.net/projects/musket/files/utils/) and should be compiled by "g++ -o memusage memusage.c" before using.

#commit:
git add .

git commit -m"Mesages"

git push -u origin master

#update
git pull
