---
title: 'BA-Seminar: <br>Kleines Einmaleins des Digitalen'
author:  
- name: Alex Flückiger
  affiliation: University of Lucerne
date: 2020
---



> “Language shapes the way we think, <br>and determines what we can think about.” <br>
> ― Benjamin Lee Whor

# Outline

In this practice-oriented seminar, students of social and cultural sciences learn relevant technical skills and programming that they can incorporate into their everyday studies. Moreover, they also develop an understanding of current developments in the field of information technology.  This course aims to foster digital literacy and to build a solid foundation for computational analysis, using Python and the command-line.

A key point of scientific work is the systematic preparation and aggregation of data and the swift retrieval of relevant information. This work requires the handling of a wide variety of data forms, including also data that is not structured in tabular form. The seminar focuses on the computational processing of digital and digitized texts. The seminar deals with questions like these:

How can texts be quantitatively exploited to complement the qualitative content analysis? What are regular expressions, and why are they so powerful in the context of text analysis? How can data be automatically downloaded from the internet and processed en masse? How can historical texts be extracted from PDFs using Optical Character Recognition (OCR)?

# Schedule

This is a new course. The material emphasized, as well as the schedule, will be adapted to the needs and interests of the students. Thus, the schedule below is provisional. Likely, we will change some topics and orderings as we go.

We have 12 seminar sessions together.

| Date             | Topic                                              |
| ---------------- | -------------------------------------------------- |
| 27 February 2020 | Introduction + Where is the digital revolution?    |
| 05 March 2020    | Text as Data                                       |
| 12 March 2020    | Setting up a Development Environment               |
| 19 March 2020    | Introduction into Command-line                     |
| 26  March 2020   | Basic NLP with Command-line                        |
| 02 April 2020    | Learning Regular Expression                        |
| 09 April 2020    | Data Sources + Ethics                              |
| 16 April 2020    | *no lecture (Osterpause)*                          |
| 23 April 2020    | Creating new Data Sets                             |
| 30 April 2020    | Introduction to Python                             |
| 07 May 2020      | NLP with Python                                    |
| 14 May 2020      | NLP with Python + Working Session                  |
| 21 May 2020      | *no lecture (Christi Himmelfahrt)*                 |
| 28 May 2020      | Mini-Project Presentations + concluding Discussion |



## Sessions

### Week 1: Introduction + Where is the digital revolution?

On the one hand, I present the goals and organization of the seminar. On the other hand, we look at some recent applications that give an impression of the fascinating prospects of computers in the area of artificial intelligence (AI) and digital humanities (DH).

[Week 1 Slides](slides/KED2020_01.html)

#### Required Reading

- David Lazer, Alex Pentland, Lada Adamic, Sinan Aral, Albert-László Barabási, Devon Brewer, Nicholas Christakis, Noshir Contractor, James Fowler, Myron Gutmann, Tony Jebara, Gary King, Michael Macy, Deb Roy, and Marshall Van Alstyne. 2009. Computational Social Science. *Science*, 323(5915):721–723, February.

#### Optional Reading

- Shawn Graham, Ian Milligan, and Scott Weingart. 2015. *Exploring Big Historical Data: The Historian’s Macroscope*. Under contract with Imperial College Press, Open Draft Version edition. http://themacroscope.org



### Week 2: Text as Data

[Week 2 Slides](slides/KED2020_02.html)



# Exercises

You need to submit three exercises to complete the seminar successfully. The point of the exercises is not to make it hard to pass but rather to foster the engagement with the covered material of this class. As you like, you may prefer to work in teams to discuss different approaches. Nonetheless, each student has to submit his own solution. 



| #    | Topic          | Published     | Deadline                    |
| ---- | -------------- | ------------- | --------------------------- |
| 1    | Data Wrangling | 19 March 2020 | 26 March 2020 (by midnight) |
| 2    | Regex NLP      | 02 April 2020 | 09 April 2020 (by midnight) |
| 3    | Python NLP     | 07 May 2020   | 14 May 2020 (by midnight)   |



Your submission is a single script, meaning that is readily executable, and is named as follows:

- Bash scripts: `SURNAME_exercise_NR.sh`
- Python scripts: `SURNAME_exercise_NR.py` 



The script follows the order of the tasks in the exercise. In addition to the commands you have used to come up with a solution, you also provide a short, yet concise explanation of the actual solution as a comment  (lines starting with `#`). Please use the following template:

```bash
#!/bin/bash

##################################################
### Exercise 1
### Seminar: Kleines Einmaleins des Digitalen
### University of Lucerne
##################################################

### task 1a)
echo "this is a test"
# solution: echo prints out the provided text in the commandline 

### task 1b)
echo -n "test" | wc
# solution: wc counts the lines, words and characters. 
# The argument -n is necessary to omit the trailing new-line symbol.  
# "test" has 4 characters.

...
```

# Mini-Project

In the final session, you present a short analysis. You are free to choose your research question as well as the used computational methods and data. It is certainly more fun when you work with data from your area of interest. 

Again, the aim of this project is not to overwhelm students with too ambitious requirements. It should be the other way around. You will have as much freedom as you need to engage with your data creatively. I hope you realize that your knowledge is already good enough to perform powerful analyses.

The only requirement is that you have to complement your claims with some quantitative facts about the data. You may work in teams of two.



# Optional: Writing a Seminar Paper

You are welcome to write a seminar paper (Hauptseminararbeit) for which you get additional credit points. As I am in the position of a guest lecturer, I will accept seminar papers accept in cooperation with [Prof. Sophie Mützel](https://www.unilu.ch/fakultaeten/ksf/institute/soziologisches-seminar/mitarbeitende/sophie-muetzel/).

Due to the practical foundation of this seminar, you are well-prepared to apply computational text analysis in a personal project subsequently. Although this is not a requirement, you may want to turn your mini-project into a seminar paper by deepening your empirical inquiry. 

Students planning to write a seminar paper should send me an email with their research idea until **10 May 2020** at the latest. When you would like to discuss your idea in person, feel free to do so any time after the seminar.

Requirements for the seminar paper (Hauptseminararbeit):

* Write your thesis in German or English
* Use any computational methods to analyze your data
* Your paper has a theoretical question guiding your methodical approach. In other words, methods are a means, not an end in themselves.
* Formal: 15 pages (A4), 12 pt Times New Roman, 3cm margin, 1.5 line spacing
* Deadline for submitting the final paper: **31 August 2020**



# Kursbeschreibung (German)

In diesem praxisorientierten Seminar erlernen die Studierenden aller Fächer der KSF zentrale technische Fertigkeiten, die sie in ihren unmittelbaren Studienalltag einbauen können, und erhalten darüber hinaus auch einen Eindruck über aktuelle technische Entwicklungen.  Das Ziel dieser Veranstaltung ist das technische Sensorium zu schärfen und eine solide Basis für weiterführende computergestützte Analysen zu schaffen.

Zentral für alle Arten des wissenschaftlichen Arbeitens ist das systematische Aufbereiten und Aggregieren von Daten sowie das selektive Auffinden von Informationen. Diese Arbeit erfordert ein Umgang mit vielfältigen Datenformen, die insbesondere auch nicht tabellarisch strukturiertes Datenmaterial umfassen. Der Seminarfokus liegt hierbei auf der computergestützten Prozessierung von digitalen und digitalisierten Texten. Das Seminar bearbeitet Fragen wie diese:

Wie lassen sich Texte quantitativ erschliessen, um die qualitative Inhaltsanalyse zu komplementieren? Was sind reguläre Ausdrücke und wieso sind diese für textanalytische Fragestellungen ungemein nützlich? Wie können Daten automatisiert aus dem Internet geladen und massenhaft verarbeitet werden? Wie können historische Texte mithilfe von Optical Character Recogniton (OCR) aus PDFs extrahiert werden?

Inputs von den Studierenden für inhaltliche Schwerpunkte sind willkommen.