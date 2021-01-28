---
title: 'Assignments'
layout: page
---



You have to submit three exercises to complete the seminar successfully. The purpose of the assignments is not to make it hard to pass the course but rather to foster your engagement with the covered topics. As you like, you may prefer to work in teams to discuss different approaches. Nonetheless, each student has to submit his own solution. 

| #    | Topic                                                        | Published     | Deadline                    |
| ---- | ------------------------------------------------------------ | ------------- | --------------------------- |
| 1    | [Data Wrangling](https://aflueckiger.github.io/KED2021/exercises/exercise_1/KED2021_exercise_1.pdf) | 18 March 2021 | 25 March 2021 (by midnight) |
| 2    | [Regex NLP](https://aflueckiger.github.io/KED2021/exercises/exercise_2/KED2021_exercise_2.pdf) | 01 April 2021 | 08 April 2021 (by midnight) |
| 3    | [Python NLP](https://aflueckiger.github.io/KED2021/exercises/exercise_3/KED2021_exercise_3.pdf) | 06 May 2021   | 13 May 2021 (by midnight)   |

## Formal Instructions

Your submission is a single script, meaning that is readily executable, and is named as follows:

- Bash scripts: `SURNAME_KED2021_NR.sh`
- Python scripts: `SURNAME_KED2021_NR.py` 

The script follows the order of the tasks in the exercise. In addition to the commands you have used to come up with a solution, you also provide a short, yet concise explanation of the actual solution as a comment (lines starting with `#`). Please use the following examples as template:

### Bash

```bash
#!/bin/bash

##################################################
### Exercise 1
### Seminar: The ABC of Computational Text Analysis
### University of Lucerne
##################################################

### task 1a)
echo "this is a test"
# solution: echo prints out the provided text in the command-line 

### task 1b)
echo -n "test" | wc
# solution: wc counts the lines, words and characters. 
# The argument -n is necessary to omit the trailing new-line symbol.
# "test" has 4 characters.

...
```

### Python

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

##################################################
### Exercise 1
### Seminar: The ABC of Computational Text Analysis
### University of Lucerne
##################################################

### task 1a)
print("Hello, World")
# outputs the provided string to the prompt

...
```


# Mini-Project

In the final session, you present a short analysis. You are free to choose your research question as well as the used computational methods and data. It is certainly more fun when you work with data from your area of interest. 

Again, the aim of this project is not to overwhelm students with too ambitious requirements. It should be the other way around. You will have as much freedom as you need to engage with your data creatively. I will be glad when you realize that your knowledge is already good enough to perform powerful analyses.

The only requirement is that you have to complement your claims with some quantitative facts about the data, which you can freely choose. You may work in teams of two.



# Optional Seminar Paper

You are welcome to write a seminar paper (Hauptseminararbeit) for which you get additional credit points. As I am in the position of a guest lecturer, I will accept seminar papers in cooperation with [Prof. Sophie Mützel](https://www.unilu.ch/fakultaeten/ksf/institute/soziologisches-seminar/mitarbeitende/sophie-muetzel/).

Due to the practical foundation of this seminar, you are well-prepared to apply computational text analysis in a personal project subsequently. Although this is not a requirement, you may want to turn your mini-project into a seminar paper by deepening your empirical inquiry. 

Students planning to write a seminar paper should send me an email with their research idea until **10 May 2021** at the latest. When you would like to discuss your idea in person, feel free to do so any time after the seminar.

Requirements for the seminar paper (Hauptseminararbeit):

* Write your thesis in German or English
* Use any computational methods to analyze your data
* Your paper has a theoretical question guiding your methodical approach. In other words, methods are a means, not an end in themselves.
* Formal: 15 pages (A4), 12 pt Times New Roman, 3cm margin, 1.5 line spacing
* Deadline for submitting the final paper: **31 August 2021**