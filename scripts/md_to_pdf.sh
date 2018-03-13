#!/usr/bin/env sh

get_files=*.md

for f in $get_files ; do
    filename="${f%.*}"
    echo "$f to $filename.pdf"
    `pandoc $f --latex-engine=xelatex  --template dslatam --highlight-style tango --variable monofont="Inconsolata" --variable fontsize=10pt -o $filename.pdf`
done
