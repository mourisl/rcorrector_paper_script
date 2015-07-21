#!/bin/sh

dataset=peach

prefix=/home/lsong/rcorrector/Evaluation/${dataset}

prog=orig
ok=25
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=seecer
ok=25
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=hshrec
ok=25
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=coral
ok=25
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=musket
ok=25
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../

prog=rcorrector
ok=25
cd ${prog}
../com.ESTmapper ${prefix}/${prog}/oases_${ok}/transcripts.fa &
cd ../


