PRESENTATION = presentation
LATEX = pdflatex
SVG_DIR = ./include

.PHONY: all clean slides svg-to-pdf

all: slides

svg-to-pdf: $(SVG_FILES)
	$(foreach file, $(wildcard $(SVG_DIR)/*.svg), \
		inkscape -C -d 1000 -A $(basename $(file)).pdf $(file);)

slides: svg-to-pdf
	$(LATEX) $(PRESENTATION)

clean:
	find . -regex '.*\.\(aux\|log\|nav\|out\|snm\|toc\)$ ' -delete
	find $(SVG_DIR) -regex '.*\.pdf$ ' -delete
	rm $(PRESENTATION).pdf
