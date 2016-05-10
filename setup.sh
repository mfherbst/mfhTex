#!/bin/sh

THISDIR=$(dirname ${BASH_SOURCE[0]})

# for tex:
export TEXINPUTS=".:$TEXINPUTS:$THISDIR:"

#For Bibtex:
export BSTINPUTS=".:$BSTINPUTS:$THISDIR:"
export BIBINPUTS=".:$BIBINPUTS:$THISDIR:"

unset THISDIR
