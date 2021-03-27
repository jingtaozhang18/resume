SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

PDFS = resume-en.pdf resume.pdf

all:	clean pdf

en:	clean xelatex resume.tex

resume-en.pdf: 
	xelatex resume_en.tex

resume.pdf: 
	xelatex resume.tex

pdf:	clean $(PDFS)

%.pdf:  %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf
