#! /bin/bash

rm -rf *.aux *.dvi *.log *.bbl *.blg *.xml
rm -rf */*.aux *.out *.toc

xelatex main.tex
bibtex main.aux
xelatex main.tex
xelatex main.tex

rm -rf *.aux *.dvi *.log *.blg *.xml
rm -rf */*.aux *.out *.toc

