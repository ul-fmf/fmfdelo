#!/bin/bash
set -e

cd predloge
for dirname in *; do
    if [ -d "$dirname" ]; then
        git clean -Xdf
        basename="Priimek-Vpisna-Leto"
        texname=$basename.tex
        pdfname=$basename.pdf
        zipname=../../arhivi/$dirname.zip

        cd $dirname
        zip -r $zipname *
        latexmk -pdf $texname
        verapdf $pdfname
        zip $zipname $pdfname

        git clean -Xdf
        cd ..
    fi
done
