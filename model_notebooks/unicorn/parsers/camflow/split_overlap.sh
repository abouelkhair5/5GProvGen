#!/bin/bash
cd ~/ds/camflow/30-04-2024
mkdir -p split
mkdir -p overlap
# split --number=l/100 -d raw/audit.json split/
number=0; while [ $number -le 9 ] ; do \
    mv split/0$number split/$number
    ((number++))
done
number=0 ; while [ $number -le 32 ] ; do \
    echo graph $number includes:
    range=0; while [ $range -le 3 ] ; do \
        echo $((3*number+range))
        cat split/$((3*number+range)) >> overlap/$number
        ((range++))
    done
    ((number++))
done
echo graph 33 includes:
echo 99
cat split/99 >> overlap/33
echo 0
cat split/0 >> overlap/33
echo 1
cat split/1 >> overlap/33
echo 2
cat split/2 >> overlap/33
number=0 ; while [ $number -le 31 ] ; do \
    echo graph $((number+34)) includes:
    range=0; while [ $range -le 3 ] ; do \
        echo $((3*number+range+2))
        cat split/$((3*number+range+2)) >> overlap/$((number+34))
        ((range++))
    done
    ((number++))
done