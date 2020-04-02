#!/bin/bash

##################################################
### Exercise 1
### Seminar: The ABC of computational Text Analysis
### University of Lucerne
##################################################


### task 1: organize your project

# create directory with the required name 
mkdir KED2020_exercise_1

# change into the created directory
cd KED2020_exercise_1

# print path to current directory
pwd

# create all the subfolders at once
mkdir reports src data data/raw data/interim 

# create a empty script file
touch script.sh

# use the given commands to create various empty files
# hint: you need to be in the folder "KED2020_exercise_1", in which "data" and its subsubfolder "interim" exists already
touch data/interim/speeches_{2015..2020}_{a..z}.txt
touch data/interim/speeches_{2015..2020}_{1..30}.txt

# change into the interim directory
cd data/interim

# use expansion to create all the directories with the name of the year at once
# hint: execute echo {2015..2020} to see what to what the expression expands
mkdir {2015..2020}


# move the newly created files into the corresponding folders using wildcard
# hint: you can use multiple wildcards at once. Each wildcard matches any sequence of characters. 
# thus, all files with a particular year in its name go into the folder of the same year.
mv *2015*.txt 2015
mv *2016*.txt 2016
mv *2017*.txt 2017
mv *2018*.txt 2018
mv *2019*.txt 2019
mv *2020*.txt 2020


# go back to the main directory KED2020_exercise_1 (two folders up)
cd ../..


# rename script and move it into the folder src with a new name
mv script.sh src/flueckiger_KED2020_ex_1.sh


### task 2: make a report of your file --

## task 2.1
# locate looks for files of these partiular endings everywhere on your computer
# the pipe | the output is redirected to the next command, which counts the number of lines (=one file per line)
# the operator > writes the output of the last comment into a new file.
locate .pdf .docx .txt | wc -l > count_documents.txt

## task 2.2
# more complicated solution that collects all the pdf recursively (any depth of subfolders). Explanation: https://superuser.com/questions/294161/unix-linux-find-and-sort-by-date-modified
# found files are passed to sort, which sorts the files numerically according to their timestamp. 
# the output is passed a second time to head, which cuts off after 20 lines.
# this final output is then written into a file with the > operator
find ~/Documents -name *.pdf -printf "%T@ %Tc %p\n" | sort -n | head -n 20  > oldest_pdf_files_1.txt


# less complicated solution that collects only the pdfs in the document folder and its immediate subfolders. 
# ls lists the pdf files up to depth one and, due to the argument -t, it orders them from new to old new.
# after piping, tail retains only the last 20 lines.
# this final output is then written into a file with the > operator
ls -t ~/Documents/*.pdf ~/Documents/*/*.pdf | tail -n 20 > oldest_pdf_files_2.txt


### feedback

