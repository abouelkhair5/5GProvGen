#!/bin/bash
cd ~/ds/camflow/30-04-2024/
number=0; while [ $number -le 24 ] ; do \
    cp train/sketch-$number.txt train/sketch-$((number+25)).txt
    ((number++))
done

number=40; while [ $number -le 49 ] ; do \
    mv train/sketch-$number.txt test/sketch-$number.txt
    ((number++))
done