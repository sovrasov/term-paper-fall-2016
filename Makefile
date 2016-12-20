.PHONY: all clean texfirst texsecond builddir refs

builddir:
	mkdir -p build

texfirst: ${IMAGES} | builddir
	xelatex -output-directory=build paper.tex

refs: texfirst
	bibtex build/paper.aux

texsecond: refs
	xelatex -output-directory=build paper.tex

clean:
	rm -r build/
	rm -r images/*.pdf

all: texsecond
