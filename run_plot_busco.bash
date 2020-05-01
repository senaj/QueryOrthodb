#! /bin/bash

set -euo pipefail # exit on any error.

source /home/jsena/software/environments/BUSCO_ENV/bin/activate

export BUSCO_CONFIG_FILE=/home/jsena/software/busco/config/config.ini
export PATH="/data/build_augustus/Augustus/bin:$PATH"
export PATH="/data/build_augustus/Augustus/scripts:$PATH"
export AUGUSTUS_CONFIG_PATH="/data/build_augustus/Augustus/config/"
export PATH=/home/jsena/software/busco/bin:$PATH

PROJECTDIR=`pwd`


# Plot Busco Results:

mkdir -p $PROJECTDIR/busco/BUSCO_summaries

cp $PROJECTDIR/busco/protein/*/*/short_summary*.txt $PROJECTDIR/busco/BUSCO_summaries/

python /home/jsena/software/busco/scripts/generate_plot.py --no_r -wd $PROJECTDIR/busco/BUSCO_summaries
