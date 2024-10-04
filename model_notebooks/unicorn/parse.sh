#!/bin/bash
if [ $# -lt 2 ]; then \
    echo "Pass date and index"
    exit 1
fi

# Use parser for each file we generated
date=$1
order=$2
root_dir='/home/aabouelk/ds/camflow/'$date/
split_dir=$root_dir'split/0'
base_dir=$root_dir'base/'
stream_dir=$root_dir'stream/'
preprocessed_dir=$root_dir'preprocessed/'
mkdir -p $base_dir
mkdir -p $stream_dir
mkdir -p $preprocessed_dir
cd /home/aabouelk/src/unicorn/parsers/camflow
start=$((order*10))
end=$((start+9))
number=$start; while [ $number -le $end ] ; do \
    python prepare.py -i $split_dir$number.txt -o $preprocessed_dir'preprocessed-'$number.txt ; \
    # python parse.py -i $preprocessed_dir'preprocessed-'$number.txt -B $base_dir'base-'$number'.txt' -S $stream_dir'stream-'$number'.txt' ; \
    # rm preprocessed$number.txt ; \
    # rm $split_dir$number.txt ; \
    ((number++))
done