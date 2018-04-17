# Latex compiler to use
LT = pdflatex -interaction batchmode
BIBTEX = bibtex

# All pdfs to generate
PDFS=MFHposter.pdf MFHiwrPresentation.pdf

.PHONY : all

all: $(PDFS)

%.pdf : %.tex
	$(LT) $*.tex
	$(BIBTEX) $*.tex || true
	$(LT) $*.tex
	$(LT) $*.tex
