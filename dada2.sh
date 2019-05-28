#!/bin/bash

Demux=""
Dada=""	
Tab=""
Stat=""

while getopts "x:a:t:s:v:" opt; do
	case $opt in
		x) Demux="$OPTARG"
		;;
		a) Dada="$OPTARG"
		;;
		t) Tab="$OPTARG"
		;;
		s) Stat="$OPTARG"
		;;
		v) Vis="$OPTARG"
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

mkdir dada2
mkdir table-dada2
mkdir stats-dada2

qiime dada2 denoise-single \
  --i-demultiplexed-seqs ${Demux}/demux.qza \
  --p-trim-left 0 \
  --p-trunc-len 120 \
  --o-representative-sequences ${Dada}/rep-seqs-dada2.qza \
  --o-table ${Tab}/table-dada2.qza \
  --o-denoising-stats ${Stat}/stats-dada2.qza
qiime metadata tabulate \
  --m-input-file ${Stat}/stats-dada2.qza \
  --o-visualization ${Vis}/stats-dada2.qzv

cd dada2
mv rep-seqs-dada2.qza rep-seqs.qza
cd ../
cd table-dada2/
mv table-dada2.qza table.qza
