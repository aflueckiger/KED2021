---
title: 'Lectures'
layout: page
date: "2021-03-01"
---

Below you find a brief description of all the lectures. I make the slides available before the lecture starts. The slides are provided in the following formats and may be opened by clicking the icon: 

- HTML to open in a browser <i class="fas fa-desktop"></i> 
- PDF document <i class="fas fa-file-pdf"></i>
- Markdown source <i class="fab fa-github"></i>
- recorded video of session  <i class="fas fa-video"></i>

## Week 1: Introduction + Where is the digital revolution?

On the one hand, I present the goals and organization of the seminar. On the other hand, we look at some recent applications that give an impression of the fascinating prospects of computers in the area of artificial intelligence (AI) and digital humanities (DH).

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_01.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_01.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_01.md)
[<i class="fas fa-video"></i>](https://tube.switch.ch/videos/1d07f265)

### Required Reading

- Lazer, David, Alex Pentland, Lada Adamic, Sinan Aral, Albert-László Barabási, Devon Brewer, Nicholas Christakis, Noshir Contractor, James Fowler, Myron Gutmann, Tony Jebara, Gary King, Michael Macy, Deb Roy, and Marshall Van Alstyne. 2009. “Computational Social Science.” *Science* 323(5915):721–23.

### Optional Reading

- Graham, Shawn, Ian Milligan, and Scott Weingart. 2015. *Exploring Big Historical Data: The Historian’s Macroscope*. Open Draft Version. Under contract with Imperial College Press. [online](http://themacroscope.org)



## Week 2: Text as Data

Computational text analysis comes with many challenges that are unique due to the fuzziness of natural language. In this session, we learn about its methodological foundation, and we conduct our first computational text analysis to understand how this translates into practice.

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_02.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_02.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_02.md)
[<i class="fas fa-video"></i>](https://tube.switch.ch/videos/60dbcd87)

## Week 3: Setting up your Development Environment

The title says it all. We are getting ready for the practical part of the course: Programming. As the installation of Python and non-standard command-line tools may be tricky, we do this in class rather than doing it as homework. Moreover, I will also introduce some principles to organize research and jargon that help you to find your way in the programmer's brave new word.

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_03.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_03.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_03.md) 
[<i class="fas fa-video"></i>](https://tube.switch.ch/videos/J1UAHX6GxT)



### Optional: pimp your workflow

- Healy, Kieran. 2019. “The Plain Person’s Guide to Plain Text Social Science.” [online](https://kieranhealy.org/publications/plain-person-text/).



## Week 4: Introduction to the Command-line

The command-line is a powerful tool at your disposal. It is the working horse for many data wrangling tasks. In this session, you learn the basics of shells and perform many operations by effectively substituting clicks on the screen with commands. Admittedly, it is not overly exciting at this stage, yet it is essential for more sophisticated automation later on.

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_04.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_04.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_04.md)

-->

### Recommended Resources

- [The Programming Historian](https://programminghistorian.org/en/lessons/intro-to-bash)
- [DigitalOcean](https://www.digitalocean.com/community/tutorials/an-introduction-to-the-linux-terminal)



## Week 5: Basic NLP with Command-line

Counting words is the most basic method to look at texts from a computational perspective. The command-line provides tools to quickly sift through a massive text collection to describe the use of words quantitatively. In no time, you can also take a systematic look at the word usage in context. Sounds like a Swiss knife for computational text analysis in social science? It certainly is.

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_05.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_05.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_05.md)

-->

## Week 6: Learning Regular Expressions

When working with text data, you spend a lot of time to clean your documents and extract some pieces of information. Doing this by hand is not only a pain but simply impossible when facing many documents. Fortunately, there is a formal language named Regular Expressions that allows writing expressive and generalizable patterns. Using these patterns, you can extract and remove any textual parts systematically without missing a single instance.

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_06.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_06.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_06.md)

-->

### Required Reading

- Ben Schmidt. 2019. Regular Expressions. [online](https://github.com/HumanitiesDataAnalysis/HDA19/blob/master/Handouts/01-regex.pdf)



### Recommended Resource

Everything we have touched about text processing in greater detail. 

- Nikolaj Lindberg. egrep for Linguists. [online](https://stts.se/egrep_for_linguists/egrep_for_linguists.pdf)



### Online Regular Expression Editor

A visual editor to check your regular expressions.

- [Rubular](https://rubular.com/)



## Week 7: RegEx + Data Sources

To this point, you have acquired the skills to cut a document into pieces and, subsequently, to extract, replace, and count any textual elements. Unless you have interesting data, these tools are neat but of no greater use. Besides some further practicing with RegEx, we turn to relevant data resources in social science. Given you have plain text at hand, your tools cut through this data like butter. For other formats, we learn about some remedies in the next session.

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_07.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_07.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_07.md)

-->

## Week 8: Creating new Data Sets + Ethics

The world we live in is not made for machines but people -- for better or for worse. While perfectly readable, documents often require a subsequent conversion to allow machine processing. Firstly, digital documents are shipped in various formats and need a conversion to plain text. Secondly, historical documents require an additional step called optical character recognition (OCR) to extract the text from the scanned original. Converting thousands of documents is easy when using the shell.

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_08.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_08.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_08.md)

-->

## Week 9: Introduction to Python

It may come as a surprise that we start with Python in the ninth session only. As the folks say, Python is among the coolest programming languages, relatively easy to learn, and provides excellent NLP packages so that you don't have to implement everything yourself. All true as long as you have your data ready. In this session, we begin with an introduction to the basic syntax of Python. Starting with this dry subject is necessary as it allows you to modify the more sophisticated NLP analyses to your needs.

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_09.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_09.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_09.md)

-->



## Week 10: NLP with Python

Python is the language of choice when it comes to serious NLP. Have you ever wondered how the frequency of terms evolves over the years? Or how the language differs between two groups of documents whereby the groups may be formed by any metadata (person, organization, gender etc.)? Exploring is most effective in an interactive and visual mode - so be it. Among some basic statistics, this is the serious stuff where we finally arrive in our journey. Moreover, you will learn the jargon of NLP to don't get lost in the forest of yet unknown terms.

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_10.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_10.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_10.md)

### Code

Go to the static code: [Python NLP](https://github.com/aflueckiger/KED2021/blob/master/scripts/KED2021_10.ipynb){:target="_blank"}

To run the code in your browser without any installation:

 [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/aflueckiger/KED2021/master) 

(path `scripts/KED2021_10.ipynb`)

-->

## Week 11: NLP with Python II + Working Session

In today's session, we continue our deep dive into NLP with Python. It is the last piece in our puzzle. During this course, you have learned about the entire workflow, from assembling datasets of documents to analyze their content and visualize your findings. As soon as you have a structured text collection along with basic meta data (e.g., publication date), you can take numerous perspectives to look at your data. At this stage, it is time for the kick-off of the mini-projects allowing you to work with your data of interest. 

<!-- 

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_11.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_11.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_11.md)



### Explore interactively: 1 August Speeches by Swiss Federal Councilors

As a matter of tradition, Swiss Federal Councilors give an official speech on Swiss National Day. Simon Schmid (journalist Republik), with the collaboration of Prof. Andreas Kley (Faculty of Law, UZH), collected many of these speeches and kindly shared the resulting dataset with me. The collection comprises 166 speeches, which is a multiple of the publicly available [here](https://www.admin.ch/gov/de/start/dokumentation/reden/ansprachen-zum-nationalfeiertag.html).

The interactive visualization linked below shows how the language differs between speakers of *Social Democratic Party of Switzerland* (SP) and speakers of other parties. The top right corner shows terms that have been frequently used by all parties, while the top left and the lower right corner reveal words that have been used primarily by the members of the SP and correspondingly by the center-right parties. 

You can search for the terms of your interest. Moreover, you may click on the points in the plot to show the context of the corresponding words within speeches. These functions allow for a quick investigation of the corpus along the dimensions of Swiss parties.

[Explore in Browser](analysis/viz_party_differences.html)  *(it takes a few seconds to load)*

-->

## Week 12: Mini-Project Presentations + Discussion

In this session, it is entirely your turn. Going beyond mere toy examples, you present what you have worked on in groups and showing off your first harvest of computational text analysis. 

The seminar is coming to an end, yet it doesn't have to be a dead-end. You may have gotten more proficient in cursing your computer but also making your way through the jungle of technology. Continue the journey, cheers!

<!--

[<i class="fas fa-desktop"></i>](https://aflueckiger.github.io/KED2021/lectures/html/KED2021_12.html)
[<i class="fas fa-file-pdf"></i>](https://aflueckiger.github.io/KED2021/lectures/pdf/KED2021_12.pdf)
[<i class="fab fa-github"></i>](https://github.com/aflueckiger/KED2021/tree/master/lectures/md/KED2021_12.md)

-->z