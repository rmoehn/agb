#!/bin/bash

cp glossar.tex glossar.tex.b
cat glossar.tex.b | perl -pe 's/\\item\[(.*?)]/\\item[$1] \\index{$1}/' > glossar.tex
latex agb.tex
biber agb
texindy -L german-duden -M german-sty agb.idx
#makeindex agb.idx
latex agb.tex
latex agb.tex
cp glossar.tex.b glossar.tex
