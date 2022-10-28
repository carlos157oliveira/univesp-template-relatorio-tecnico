SRCS := $(shell find . -name '*.tex')

relatorio.pdf: $(SRCS)
	latex --output-format=pdf relatorio.tex
	biber relatorio.bcf
	latex --output-format=pdf relatorio.tex
	latex --output-format=pdf relatorio.tex

.PHONY: clean
clean:
	rm -f *.aux *.bbl *.bcf *.blg *.log *.toc *.lof *.run.xml
