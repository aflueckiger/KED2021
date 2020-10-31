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


## Location of Pandoc support files.
PREFIX = /home/alex/pandoc-templates

## Location of CSS file
CSS = slides/resources/custom_style_reveal.css

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


# SLIDES
SLIDES_DIR?= slides
SLIDES_MD_DIR?= $(SLIDES_DIR)/md
SLIDES_HTML_DIR?= $(SLIDES_DIR)/html
SLIDES_PDF_DIR?= $(SLIDES_DIR)/pdf
NOTES_DIR?= $(SLIDES_DIR)/notes

slides-md := $(wildcard $(SLIDES_MD_DIR)/*.md)
slides-html := $(patsubst $(SLIDES_MD_DIR)/%.md,$(SLIDES_HTML_DIR)/%.html,$(slides-md))
notes-pdf := $(patsubst $(SLIDES_MD_DIR)/%.md,$(NOTES_DIR)/%.notes.pdf,$(slides-md))
notes: $(notes-pdf)
slides:	$(slides-html) $(notes-pdf)

BASE_URL?= file:///home/alex/drive/lehrauftrag_unilu/KED2020
slides-pdf := $(patsubst $(SLIDES_HTML_DIR)/%.html,$(SLIDES_PDF_DIR)/%.pdf,$(slides-html))
slides-pdf: $(slides-pdf)


# EXERCISES
EXERCISES_DIR = exercises
exercises-md := $(wildcard $(EXERCISES_DIR)/**/*.md)
exercises-pdf := $(exercises-md:.md=.pdf)
exercises:	$(exercises-pdf)

# MATERIALS
MATERIALS_DIR = materials
materials-md := $(wildcard $(MATERIALS_DIR)/*.md)
materials-pdf := $(materials-md:.md=.pdf)
materials:	$(materials-pdf)

# SYLLABUS
syllabus-pdf:= KED2020_syllabus.pdf
syllabus: $(syllabus-pdf)


print-%:
	@echo $* = $($*)

prepare-dir:
	mkdir -p $(SLIDES_DIR)
	mkdir -p $(SLIDES_PDF_DIR)
	mkdir -p $(SLIDES_HTML_DIR)
	mkdir -p $(SLIDES_MD_DIR)
	mkdir -p $(NOTES_DIR)
	mkdir -p $(EXERCISES_DIR)
	mkdir -p $(MATERIALS_DIR)


all: $(slides-html) $(slides-pdf) $(materials-pdf) $(exercises-pdf) $(notes-pdf)


$(SLIDES_HTML_DIR)/%.html: $(SLIDES_MD_DIR)/%.md $(CSS)
	pandoc -f markdown+emoji+strikeout -t revealjs -s -o $@ $< \
	-V theme=night \
	-V navigationMode=linear \
	-V slideNumber=true \
	-V biblio-title:References \
	--include-in-header $(CSS) \
	#--citeproc \
	#-V $(TEX_REF) \
	# --bibliography=$(BIB)
	# --filter pandoc-citeproc \

	# --metadata link-citations \
	# --csl=$(CSL)
	# $(CROSSREF)

$(NOTES_DIR)/%.notes.pdf: $(SLIDES_DIR)/%.md lib/extract_notes.py
	python lib/extract_notes.py < $< | pandoc -o $@ -f markdown

$(SLIDES_PDF_DIR)/%.pdf: $(SLIDES_HTML_DIR)/%.html
	decktape --size 1920x1080 $(BASE_URL)/$<  $@


KED2020_syllabus.pdf: index.md
	cat $< | sed 's/{:target="_blank"}//g' > temp.md
	pandoc -o $@ temp.md \
	--toc \
	--toc-depth=1 \
	--number-sections \
	-V geometry:margin=2.5cm \
	-V urlcolor='[HTML]{111bab}' \
	-V linkcolor='[HTML]{111bab}' \
	-V filecolor='[HTML]{111bab}' \
	--lua-filter=/home/alex/lua-filters/scholarly-metadata/scholarly-metadata.lua \
	--lua-filter=/home/alex/lua-filters/author-info-blocks/author-info-blocks.lua
	rm temp.md

%.pdf: %.md
	pandoc -o $@ $< \
	--variable urlcolor=blue \
	--lua-filter=/home/alex/lua-filters/scholarly-metadata/scholarly-metadata.lua \
	--lua-filter=/home/alex/lua-filters/author-info-blocks/author-info-blocks.lua \
	--number-sections
	# --template=$(PREFIX)/templates/latex_alex.template
	# --filter pandoc-citeproc --csl=$(CSL) --bibliography=$(BIB)

clean:
	rm -f **/*.html **/*.pdf **/*.tex **/*.bcf **/*.blg



### OLD PDF METROPOLIS SLIDES
%.old_pdf:	%.tex
	pandoc --standalone \
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
