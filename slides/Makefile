## Put this Makefile in your project directory---i.e., the directory
## containing the paper you are writing. Assuming you are using the
## rest of the toolchain here, you can use it to create .html, .tex,
## and .pdf output files (complete with bibliography, if present) from
## your markdown file.
## -	Change the paths at the top of the file as needed.
## -	Using `make` without arguments will generate html, tex, and pdf
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this.
## -	You can specify an output format with `make tex`, `make pdf` or
## - 	`make html`.
## -	Doing `make clean` will remove all the .tex, .html, and .pdf files
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep!


## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(filter-out README.md, $(wildcard *.$(MEXT)))

## Location of Pandoc support files.
PREFIX = /home/alex/pandoc-templates


## Location of CSS file
CSS = ../resources/custom_style_reveal.css

## Location of your working bibliography file
BIB = /home/alex/drive/zotero/references.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = /home/alex/Zotero/styles/american-sociological-association.csl


# LaTeX doesn't use pandoc-citeproc + CSL and instead lets biblatex handle the
# heavy lifting. There are three possible styles built in to the template:
#	- bibstyle-chicago-notes
#	- bibstyle-chicago-authordate
#	- bibstyle-apa
TEX_REF = bibstyle-chicago-authordate

# Cross reference options
CROSSREF = --filter pandoc-crossref -M figPrefix:"Figure" -M eqnPrefix:"Equation" -M tblPrefix:"Table"

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)


MD_DIR?= md_slides
PDF_DIR?= pdf_slides
TEX_DIR?= tex_slides
HTML_DIR?= html_slides

md_slides := $(wildcard $(MD_DIR)/*.md)
pdf_slides := $(patsubst $(MD_DIR)/%.md,$(PDF_DIR)/%.pdf,$(md_slides))
tex_slides := $(patsubst $(MD_DIR)/%.md,$(TEX_DIR)/%.tex,$(md_slides))
html_slides := $(patsubst $(MD_DIR)/%.md,$(HTML_DIR)/%.html,$(md_slides))


print-%:
	@echo $* = $($*)

prepare-dir:
	mkdir -p $(MD_DIR)
	mkdir -p $(PDF_DIR)
	mkdir -p $(TEX_DIR)
	mkdir -p $(HTML_DIR)

all:	$(PDFS) $(HTML) $(TEX)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)

new_CSS = custom_style_reveal.css
new_BIB = references.bib

%.html:	%.md
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` \
	pandoc/core:latest -f markdown+emoji -t revealjs -s -o $@ $< \
	-V revealjs-url=https://revealjs.com -V theme=night  \
	-V navigationMode=linear \
	-V slideNumber=true \
	-V biblio-title:References \
	--include-in-header $(new_CSS) \
	-V $(TEX_REF) \
	--filter pandoc-citeproc \
	--bibliography=$(new_BIB) \
	# --csl=$(CSL)
	 # 	$(CROSSREF) \
	 #

%.tex: %.md
	pandoc -t beamer --pdf-engine=xelatex -V theme:metropolis -o $@ $<

%.pdf:	%.tex
	pandoc --standalone \
	-H $(MD_DIR)/tex_config.tex \
	--toc \
	--filter pandoc-latex-unlisted \
	-V toc-title:"Outline" \
	-V biblio-title:References \
	$(CROSSREF) \
	-V $(TEX_REF) \
	--filter pandoc-citeproc \
	--bibliography=$(BIB) \
	-t beamer \
	-V theme:metropolis \
	--pdf-engine=xelatex \
	-o $@ $<  #  aspectratio:169 -V fontsize:14pt
	# pandoc -s -t beamer -V theme:metropolis   -o $@_.pdf $<

clean:
	rm -f *.html *.pdf *.tex *.bcf *.blg
