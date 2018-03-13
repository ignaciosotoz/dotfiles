#!/usr/bin/env sh

get_files=*.ipynb

for f in $get_files ; do
    filename="${f%.*}"
    echo "Converting $f to $filename.md"
    `jupyter nbconvert --to markdown $f`
    echo "Converting $filename.md to $filename.pdf"
    `pandoc $f --latex-engine=xelatex --template dslatam --highlight-style tango --variable monofont="Inconsolata" --variable fontsize=10pt -o $filename.pdf`
    echo "Removing ancilliary $filename.md"
    `rm $filename.md`
done
