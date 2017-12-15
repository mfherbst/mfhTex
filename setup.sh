#!/bin/bash

THISDIR=$(dirname ${BASH_SOURCE[0]})

# for tex:
export TEXINPUTS=".:$TEXINPUTS:"
for dir in baposter mfh; do
	export TEXINPUTS="${TEXINPUTS}$THISDIR/$dir:"
done

#For Bibtex:
export BSTINPUTS=".:$BSTINPUTS:$THISDIR:"
export BIBINPUTS=".:$BIBINPUTS:$THISDIR:"

unset THISDIR
