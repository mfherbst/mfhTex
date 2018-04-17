# Latex compiler to use
LT = pdflatex -interaction nonstopmode
BIBTEX = bibtex

# All pdfs to generate
PDFS=MFHposter.pdf MFHiwrPresentation.pdf

pdf: $(PDFS)

all: pdf

clean:
	rm -f $(PDFS) *.aux *.log *.nav *.out *.snm *.toc

%.pdf : %.tex
	$(LT) $*.tex
	$(BIBTEX) $* || true
	$(LT) $*.tex
	$(LT) $*.tex

.PHONY : all clean pdf
