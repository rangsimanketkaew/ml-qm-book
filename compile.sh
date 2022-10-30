#!/bin/bash

# Copyright (c) 2022 รังสิมันต์ เกษแก้ว (Rangsiman Ketkaew).

# License: Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
# https://creativecommons.org/licenses/by-nc-nd/4.0/

# --------------------------------------------------

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
