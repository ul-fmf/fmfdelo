#!/bin/bash
rm template.zip
rm template_english.zip
zip template.zip magisterij.tex magisterij.pdf literatura.bib fmf-sl.bst images/*
zip template_english.zip magisterij_english.tex magisterij_english.pdf literatura.bib fmf-en.bst images/*
