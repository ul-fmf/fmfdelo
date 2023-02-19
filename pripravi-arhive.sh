#!/bin/bash
set -e

echo "Installing veraPDF"
sudo apt-get install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --noninteractive flathub org.verapdf.veraPDF

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
        flatpak run --command=verapdf org.verapdf.veraPDF $pdfname
        zip $zipname $pdfname

        git clean -Xdf
        cd ..
    fi
done
