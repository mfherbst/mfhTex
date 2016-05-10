# mfhTex

Default setup for typesetting ``LaTeX`` documents.

## Setup
You have two options:

### Install into local TeX tree
Checkout the repository directly into your local tex package tree.
This is usually the directory ``~/texmf/tex/latex/``, i.e. you run
```
cd ~/texmf/tex/latex/
git clone "https://github.com/mfherbst/mfhTex.git" .
```

### Tell TeX where to look for
Checkout the repository to any place you like.
Then before running ``tex`` or ``latex``, you source the script ``setup.sh`` from your shell:
```
. /path/to/this/repo/setup.sh
pdflatex yourfile.tex
```
