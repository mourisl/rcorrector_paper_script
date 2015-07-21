#!/bin/sh

dataset=geuvadis

prefix=/home/lsong/rcorrector/Evaluation/${dataset}

prog=orig
ok=27
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=seecer
ok=27
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=hshrec
ok=27
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=coral
ok=27
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=musket
ok=27
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=rcorrector
ok=27
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../


