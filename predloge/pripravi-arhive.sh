#!/bin/bash

for dirname in *; do
    if [ -d "$dirname" ]; then
        git clean -Xdf
        basename="Priimek-Vpisna-Leto"
        texname=$basename.tex
        pdfname=$basename.pdf
        zipname=../../arhivi/$dirname.zip

        cd $dirname
        zip $zipname *
        latexmk -pdf $texname
        zip $zipname $pdfname

        git clean -Xdf
        cd ..
    fi
done
