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
CSS = lectures/resources/custom_style_reveal.css

## Location of your working bibliography file
BIB = /home/alex/drive/zotero/references.bib

TITLE?= "BA Seminar: The ABC of Computational Text Analysis"

# LECTURES
LECTURES_DIR?= lectures
LECTURES_MD_DIR?= $(LECTURES_DIR)/md
LECTURES_HTML_DIR?= $(LECTURES_DIR)/html
LECTURES_PDF_DIR?= $(LECTURES_DIR)/pdf
NOTES_DIR?= $(LECTURES_DIR)/notes

lectures-md := $(wildcard $(LECTURES_MD_DIR)/*.md)
lectures-html := $(patsubst $(LECTURES_MD_DIR)/%.md,$(LECTURES_HTML_DIR)/%.html,$(lectures-md))
notes-pdf := $(patsubst $(LECTURES_MD_DIR)/%.md,$(NOTES_DIR)/%.notes.pdf,$(lectures-md))
notes: $(notes-pdf)
lectures: $(lectures-html) $(notes-pdf)

lectures-pdf := $(patsubst $(LECTURES_HTML_DIR)/%.html,$(LECTURES_PDF_DIR)/%.pdf,$(lectures-html))
lectures-pdf: $(lectures-pdf)


# ASSIGNMENTS
ASSIGNMENTS_DIR = assignments
assignments-md := $(wildcard $(ASSIGNMENTS_DIR)/**/*.md)
assignments-pdf := $(assignments-md:.md=.pdf)
assignments:	$(assignments-pdf)

# MATERIALS
MATERIALS_DIR = materials
materials-md := $(wildcard $(MATERIALS_DIR)/*.md)
materials-pdf := $(materials-md:.md=.pdf)
materials:	$(materials-pdf)

# SYLLABUS
syllabus-pdf:= KED2021_syllabus.pdf
syllabus: $(syllabus-pdf)

# TROUBLESHOOTING
print-%:
	@echo $* = $($*)

jekyll-run-local:
	bundle exec jekyll serve

prepare-dir:
	mkdir -p $(LECTURES_PDF_DIR)
	mkdir -p $(LECTURES_HTML_DIR)
	mkdir -p $(LECTURES_MD_DIR)
	mkdir -p $(NOTES_DIR)
	mkdir -p $(ASSIGNMENTS_DIR)
	mkdir -p $(MATERIALS_DIR)


all: $(lectures-html) $(lectures-pdf) $(materials-pdf) $(assignments-pdf) $(syllabus-pdf) $(notes-pdf)


$(LECTURES_HTML_DIR)/%.html: $(LECTURES_MD_DIR)/%.md $(CSS)
	pandoc -f markdown+emoji+strikeout -t revealjs -s -o $@ $< \
    --no-highlight \
    -V theme=simple \
    -V navigationMode=linear \
    -V slideNumber=true \
    -V width=1920 -V height=1080 \
    --include-in-header lectures/resources/custom_style_reveal.css lectures/resources/code_highlighting.html \
	-V biblio-title:References \
    --citeproc \
    --bibliography /home/alex/drive/zotero/references.bib


$(NOTES_DIR)/%.notes.pdf: $(LECTURES_DIR)/%.md lib/extract_notes.py
	python lib/extract_notes.py < $< | pandoc -o $@ -f markdown

$(LECTURES_PDF_DIR)/%.pdf: $(LECTURES_HTML_DIR)/%.html
	decktape --load-pause 500 $< $@
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@.temp $@
	mv $@.temp $@


KED2021_syllabus.pdf: index.md schedule.md lectures.md assignments.md
	cat index.md <(echo "[Go to Course Website](https://aflueckiger.github.io/KED2021/)" ) | grep -v "Go to UniLu website" | sed '/<div/,/div>/d'	> index.md.tmp
	sed '5 a # Schedule' schedule.md | sed 's/.lectures//' > schedule.md.tmp
	sed '5 a # Lectures' lectures.md | sed 's/!.*\.svg)/Binder/' > lectures.md.tmp
	sed '5 a # Assignments' assignments.md > assignments.md.tmp
	pandoc -o $@ index.md.tmp schedule.md.tmp lectures.md.tmp assignments.md.tmp \
	--from markdown \
	--toc \
	--toc-depth=1 \
	--number-sections \
	-V geometry:margin=2.5cm \
	-V urlcolor='[HTML]{111bab}' \
	-V linkcolor='[HTML]{111bab}' \
	-V filecolor='[HTML]{111bab}' \
	--metadata title=$(TITLE) \
	--metadata date="`date -u '+%d %B %Y'`"
	rm *.tmp

%.pdf: %.md
	pandoc -o $@ $< \
	-V urlcolor='[HTML]{111bab}' \
	-V linkcolor='[HTML]{111bab}' \
	-V filecolor='[HTML]{111bab}' \
	--number-sections \
	--metadata date="`date -u '+%d %B %Y'`"


clean:
	rm -f **/*.html **/*.pdf **/*.tex **/*.bcf **/*.blg
