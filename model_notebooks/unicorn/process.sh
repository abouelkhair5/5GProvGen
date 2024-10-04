#!/bin/bash
if [ $# -lt 2 ]; then \
    echo "Pass date and index"
    exit 1
fi
date=$1
root_dir='/home/aabouelk/ds/camflow/'$date/
compressed_dir=$root_dir'compressed/'
order=$2

archive=$compressed_dir$order.gz.tar
split_dir=$root_dir'split/'
mkdir -p $split_dir
echo 'Extracting '$archive' into '$split_dir
tar -z --get -v -f $archive --directory $split_dir
order_dir=$split_dir$order/
n_splits=3
echo 'Spliting each file in '$order_dir' into '$n_splits;
# Split each file in the extracted archive into 3
segment=0; while [ $segment -le 9 ] ; do \
    idx_to_split=$((order*10+segment)); \
    echo 'Splitting '$order_dir$idx_to_split'.txt' ; \
    n=1; while [ $n -le $n_splits ] ; do \
        idx_dest=$((idx_to_split*3+n-1)); \
        echo 'Chunk: '$idx_dest ; \
        split --number=l/$n/$n_splits -d $order_dir$idx_to_split.txt > $split_dir$idx_dest.txt ; \
        ((n++))
    done
    echo 'Deleting '$order_dir$idx_to_split'.txt' ; \
    rm $order_dir$idx_to_split.txt ; \
    ((segment++))
done
rm -d $order_dir