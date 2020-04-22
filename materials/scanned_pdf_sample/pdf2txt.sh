################################
### CONVERT SCANNED PDF TO TXT
################################

# replace spaces with underscores in filenames
for f in *\ *; do mv "$f" "${f// /_}"; done


# convert pdf-files to txt-files
for FILEPATH in *.pdf; do 

	# convert pdf to image
    convert -density 300 $FILEPATH -depth 8 -strip \
    -background white -alpha off temp.tiff
    
    # define output name
    OUTFILE=${FILEPATH%.docx} 
    
    # perform OCR on the tiff image
    tesseract -l deu temp.tiff $OUTFILE
    
    # remove the intermediate tiff image
    rm temp.tiff

done
