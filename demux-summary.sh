#!/bin/bash

Demux=""
Sum=""	
while getopts "x:y:" opt; do
	case $opt in
		x) Demux="$OPTARG"
		;;
		y) Sum="$OPTARG"
		;;
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

mkdir visuals

qiime demux summarize \
  --i-data ${Demux}/demux.qza \
  --o-visualization ${Sum}/demux.qzv
