# mfhTex

Default setup for typesetting ``LaTeX`` documents.

## Setup the files
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

### 3rd party images
- Due to copyright reasons certain images (like the IWR or University of Heidelberg logo)
  cannot be shipped along with this project.
- Substitute *dummy images* are provided such that everything still works out of
  the box.
  This affects for example the **mfhIWR** beamer theme.
- If you want the proper images just run the ``get_3rd_party.sh`` script in this repo
  by executing
```
cd path/to/this/repo
./get_3rd_party.sh
```
