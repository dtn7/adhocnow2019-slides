PRESENTATION = presentation
LATEX = pdflatex

all:
	$(LATEX) $(PRESENTATION)

.PHONY: clean
clean:
	find -regex '.*\.\(aux\|log\|nav\|out\|snm\|toc\)$ ' -delete
	rm $(PRESENTATION).pdf
