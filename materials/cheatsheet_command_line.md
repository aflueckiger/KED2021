---
title: Cheatsheet Shell Commands
author:  
- name: Alex Flückiger
  email: 'alex.flueckiger@doz.unilu.ch'
date: 2020
toc: True
toc-depth: 2
---


| Shell Command                                       | Explanation                                                  |
| --------------------------------------------------- | ------------------------------------------------------------ |
| `cd` *filepath*                                     | **c**hange **d**irectory aka move into a different folder    |
| `ls`                                                | **l**i**s**t the files and folders in your current **dir**ectory |
| `pwd`                                               | show **p**ath of **w**orking **d**irectory aka the folder that you're in right now |
| `touch` *filename*                                  | make a new file                                              |
| `mkdir` *directory-name*                            | **m**a**k**e a new **dir**ectory aka a folder                |
| `rm` *filename*                                     | **r**e**m**ove aka delete a file or directory                |
| `cp` *original-filename* *copied-filename*          | **c**o**p**y a file or directory                             |
| `mv` *original-filename* *new-filename*             | **m**o**v**e or rename a file or directory                   |
| `cat` *filename*                                    | show all the contents of a file                              |
| `less` *filename*                                   | show snippet of a file that allows you to scroll through the entire thing |
| `head` *filename*                                   | show the first 10 lines of a file (change number of lines by adding `-*a number*` flag e.g. `head -100`) |
| `tail` *filename*                                   | show the last 10 lines of a file (change number of lines by adding `-*a number*` flag e.g. `tail -100`) |
| `wc -w -l` *filename*                               | show how many **w**ords or lines in a file                   |
| `man` *command*                                     | show the **man**ual aka the documentation that tells you what a particular command does |
| `echo`                                              | print text to the command line                               |
| `grep` \search term\ *filename* or *directory-name* | search for lines that include search term in file            |
| `wget` *url*                                        | **get** a file from the **w**eb                              |



This cheatsheet is based on [this resource](https://melaniewalsh.github.io/Intro-Cultural-Analytics/Command-Line/The-Command-Line.html#). Please also refer to this resource for a more in dept explanation in prose. You should follow the guide for macOS and Unix even as a Windows user as we have installed a Unix environment.