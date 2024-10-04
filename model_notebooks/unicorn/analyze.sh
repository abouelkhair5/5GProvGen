#!/bin/bash
if [ $# -lt 2 ]; then \
    echo "Pass date and index"
    exit 1
fi

# Use parser for each file we generated
date=$1
order=$2
# Update the root dir for the dataset
root_dir='/home/aabouelk/ds/camflow/'$date/
split_dir=$root_dir'split/'
base_dir=$root_dir'base/'
stream_dir=$root_dir'stream/'
cd /home/aabouelk/src/unicorn/analyzer
train_dir=$root_dir'train/'
mkdir -p $train_dir
start=$((order*30))
end=$((start+29))
number=$start; while [ $number -le $end ] ; do \
    bin/unicorn/main filetype edgelist base $base_dir'base-'$number'.txt' stream $stream_dir'stream-'$number'.txt' decay 500 lambda 0.02 batch 2000 sketch $train_dir'sketch-'$number'.txt' chunkify 1 chunk_size 50 ; \
    rm -rf $base_dir'base-'$number.txt.* ; \
    rm -rf $base_dir'base-'$number.txt_* ; \
    ((number++))
done
