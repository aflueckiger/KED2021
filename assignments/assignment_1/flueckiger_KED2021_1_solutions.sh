#!/bin/bash

##################################################
### Assignment 1
### Seminar: The ABC of Computational Text Analysis
### University of Lucerne
##################################################


### Task 1: organize your project

# create directory with the required name 
mkdir KED2021_exercise_1

# change into the created directory
cd KED2021_exercise_1

# print path to current directory (e.g., ~/KED2021/KED2021_exercise_1)
pwd

# create all the subfolders at once
mkdir reports src data data/raw data/interim

# use the given commands to create various empty files
# hint: you need to be in the folder "KED2021_exercise_1", in which "data" and its subsubfolder "interim" exists already
touch data/interim/speeches_{2015..2021}_{a..z}.txt
touch data/interim/speeches_{2015..2021}_{1..30}.txt

# change into the interim directory
cd data/interim

# Use expansion to create all the directories with the name of the year at once.
# Hint: run echo {2015..2021} to see to what the expression expands
mkdir {2015..2021}


# Move the newly created files into the corresponding folders using wildcard.
# Hint: you can use multiple wildcards at once. Each wildcard matches any sequence of characters. 
# Thus, all files with a particular year in its name go into the folder of the corresponding year.
mv *2015*.txt 2015
mv *2016*.txt 2016
mv *2017*.txt 2017
mv *2018*.txt 2018
mv *2019*.txt 2019
mv *2021*.txt 2021


# go back to the main directory KED2021_exercise_1 (two folders up)
cd ../..


### Task 2: Make a report of your file

## Task 2.1
# `locate` looks for files of these partiular endings everywhere on your computer
# The output of `locate` is redirected to the `wc` command by the pipe operator `|`. `wc` counts the number of lines (=one file per line).
# The operator `>` writes the output of the final command into a new file.
locate .pdf .docx .txt | wc -l > count_documents.txt

## Task 2.2
# A simple solution that lists any pdfs located in the document folder and its subfolders.
# `ls` lists any pdf files up to an arbitrary using wildcards and, due to the argument -t, it orders them from new to old new.
# After piping, `tail` retains only the last 20 lines.
# This final output is then written into a file with the `>` operator
ls -t ~/Documents/**/*.pdf | tail -n 20 > oldest_pdf_files_2.txt


# While the use of `**` instructs `ls` to match files in any subdirectory, the single `*` is a wildcard that matches an arbitrary name of a file or directory.
# Don't worry if you have not used the double wildcard and check for more information here: 
# https://stackoverflow.com/questions/28176590/what-do-double-asterisk-wildcards-mean



### Your feedback

