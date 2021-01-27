#!/bin/bash

##################################################
### Exercise 2
### Seminar: The ABC of computational Text Analysis
### University of Lucerne
##################################################


### exercise to parse and remove meta information like this from a document:

# Von BRUNO VANONI, BERN.      
# 591 words
# 26 February 2004
# Tages Anzeiger
# TANZ
# German
# (c) 2004 Tages Anzeiger Homepage Address:      http://www.tages-anzeiger.ch 


### task 1: Parse Information with RegEx

### general hints
# As meta information always starts at the beginning of a new line, use ^ to be more specific and avoid false positive matches. 
# Analog, the $ symbol to match the end of the line.


# task 1.1: parse number of words
# include comma as there are numbers like 1,529
egrep  "^[0-9,]+ words$" newspaper_articles.txt > words.txt


# task 1.2:  parse dates
# assuming dates of the format: X MONTH XXXX or XX MONTH XXXX
egrep  "^[0-9]{1,2} \w+ [0-9]{4}$" newspaper_articles.txt > dates.txt


# task 1.2:  parse author names 
# authors are not given for all articles
# some examples are really hard to match like:
#   Von DAS GESPRÄCH FÜHRTEN IWAN STÄDLER UND VERENA ARBURG
#   Von MIT ALEX SCHEIWILLER* SPRACH ERWIN HAAS. 
# Practically, it's not worth to cover them unless you really need them. Removing is easier than exact extracting.
# Moreover, it takes more sophisticated patterns (lookarounds, see below) or even a machine-learning approach.
# Both approaches go beyond what you learn in this seminar.

# assuming names consist of uppercased letters, dots (e.g. abbreviated names), hyphens (e.g. double names) and spaces (e.g. firstname secondname lastname).
# thus, locations are excluded as they are preceded by commas.
egrep  "^[vV]on [A-ZÄÜÖ .-]+" newspaper_articles.txt > authors.txt



### task 2: Removing Parts of a Document
# Simply reuse the patterns from above and replace the matches with an empty sequence (i.e. nothing). Names are removed completely.
cat newspaper_articles.txt | sed -E "s/^[0-9,]+ words$//g" | sed -E "s/^[0-9]{1,2} \w+ [0-9]{4}$//g" | sed -E "s/^[vV]on [A-ZÄÜÖ .-].*//g" > clean.txt


####################################
# Further Information
####################################

# count the number of articles. With this information, you know how many matches you should get in task 1)
egrep  "^Document" newspaper_articles.txt | wc -l
# the number of documents should equal the number of matches (e.g. words)
egrep  "^[0-9,]+ words$" newspaper_articles.txt | wc -l

# check the differences between the original file and the clean file 
diff -y --suppress-common-lines newspaper_articles.txt clean.txt 

# More poweful engines (like the one in Perl/Python) support negative/positive lookahead and lookbehind operators to make the match context-specific without matching it. 
# See https://www.rexegg.com/regex-lookarounds.html
# As the idea is very similar to what you already know, you are well-equipped to catch up on your own. 
# Even without using lookarounds, you can simply pipe multiple regex operations to subsequentally remove more information (like "von" before the author name) to get the same result.
egrep  "^[vV]on [A-ZÄÜÖ .-]+" newspaper_articles.txt | sed 's/^Von //'
