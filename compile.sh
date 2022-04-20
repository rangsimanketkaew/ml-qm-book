#!/bin/bash

# Tested with TeX Live 2018 v.6.3.0
# Pipeline: xelatex -> bibtex -> xelatex -> xelatex
# Usage: sh compile.tex book.tex

BASE="${1%.*}"

OPT="-synctex=1 -interaction=batchmode -file-line-error"
# for printing warnings use -interaction=nonstopmode instead

xelatex $OPT $BASE.tex
if [ $? -ne 0 ]; then
    echo "Compilation error. Check log."
    exit 1
fi
bibtex $BASE
xelatex $OPT $BASE.tex
xelatex $OPT $BASE.tex
exit 0
