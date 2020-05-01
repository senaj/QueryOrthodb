#! /bin/bash

set -euo pipefail # exit on any error.

source /home/jsena/software/environments/BUSCO_ENV/bin/activate

export BUSCO_CONFIG_FILE=/home/jsena/software/busco/config/config.ini
export PATH="/data/build_augustus/Augustus/bin:$PATH"
export PATH="/data/build_augustus/Augustus/scripts:$PATH"
export AUGUSTUS_CONFIG_PATH="/data/build_augustus/Augustus/config/"
export PATH=/home/jsena/software/busco-4.0.1/bin:$PATH

PROJECTDIR=`pwd`

mkdir -p $PROJECTDIR/busco/$2/$1

OUTDIR=$PROJECTDIR/busco/$2/$1
INPUT=$PROJECTDIR/peptides/$1 # input file namei prefix
OUTPUT=$OUTDIR/$1 # output file name
MODE=$2
THREADS=16
# Usage: busco -m MODE -i INPUT -o OUTPUT -l LINEAGE

cd $OUTDIR
busco -f -c $THREADS -m $MODE -i $INPUT -o $1 --auto-lineage-euk


# Plot Busco Results:

#mkdir -p $PROJECTDIR/busco/BUSCO_summaries

#cp $PROJECTDIR/busco/protein/$1/$1/short_summary*.txt $PROJECTDIR/busco/BUSCO_summaries/

#python /home/jsena/software/busco/scripts/generate_plot.py -wd $PROJECTDIR/busco/BUSCO_summaries
