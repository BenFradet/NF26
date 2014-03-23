#!/bin/bash
old=$1
new=$2
for file in $(find . -type f -name "*.sql")
do
    sed -i "s/$old/$new/g" $file
done
