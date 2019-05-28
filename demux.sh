#!/bin/bash

Seq=""
Met=""	
Demux=""

while getopts "o:m:x:" opt; do
	case $opt in
		o) Out="$OPTARG"
		;;
		m) Met="$OPTARG"
		;;
		x) Demux="$OPTARG"
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

mkdir demultiplex-sequences

qiime demux emp-single \
  --i-seqs ${Out}/emp-single-end-sequences.qza \
  --m-barcodes-file ${Met} \
  --m-barcodes-column BarcodeSequence \
  --o-per-sample-sequences ${Demux}/demux.qza 
