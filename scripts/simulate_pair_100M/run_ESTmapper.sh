#!/bin/sh

REF=/home/lsong/data/hg19.fa
dataset=simulate_pair_100M

prefix=/home/lsong/rcorrector/Evaluation/${dataset}


prog=seecer
ok=57
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=hshrec
ok=57
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=coral
ok=63
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../
exit
prog=musket
ok=57
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa
cd ../

prog=rcorrector
ok=57
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa
cd ../

exit

prog=orig
ok=63
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa
cd ../
