#!/bin/bash

In=""
Out=""	
while getopts "i:o:" opt; do
	case $opt in
		i) In="$OPTARG"
		;;
		o) Out="$OPTARG"
		;;
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

mkdir output-emp-single-end-sequences

qiime tools import \
  --type EMPSingleEndSequences \
  --input-path ${In} \
  --output-path ${Out}/emp-single-end-sequences.qza
