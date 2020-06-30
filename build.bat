del *.aux *.dvi *.log *.bbl *.blg *.xml
del */*.aux

xelatex main.tex
bibtex main.aux
xelatex main.tex
xelatex main.tex

