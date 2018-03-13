#!/usr/bin/env sh

get_files=*.ipynb

for f in $get_files ; do
    filename="${f%.*}"
    echo "$f to $filename.md"
    `jupyter nbconvert --to markdown $f`
done
