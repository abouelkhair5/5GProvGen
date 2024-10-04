#!/bin/bash
number=19 ; while [ $number -le 99 ] ; do \
    python prepare.py -i ~/ds/camflow/30-04-2024/split/$number -o preprocessed-1.txt ; \
    python parse.py -i preprocessed-1.txt -B ~/ds/camflow/30-04-2024/base/base-$number.txt -S ~/ds/camflow/30-04-2024/stream/stream-$number.txt ; \
    rm preprocessed-1.txt ; \
    ((number++))
    ((number++))
done 