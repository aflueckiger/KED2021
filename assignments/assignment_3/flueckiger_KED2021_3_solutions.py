#!/usr/bin/env python
# coding: utf-8

##################################################
# Exercise 3 - Sample Solution
# Alex Flückiger
# Seminar: The ABC of computational Text Analysis
# University of Lucerne
##################################################

# task 2: working directory
# My working directory is set to '/Users/alex/lehrauftrag_unilu/KED2020'
# All the file path should be defined relative to this directory.
# To run this script from the command line,
# you also need to navigate to this directory and call:
# python exercises/exercise_3/flueckiger_KED2020_ex_3_solutions.py

# task 3: import the modules that are needed
import textacy
import pandas as pd

# task 4: create a corpus
# define new function to read text from csv file (copied as given in assignment)

# load German language model
de = textacy.load_spacy_lang("de_core_news_sm")


def get_texts_from_csv(f_csv, text_column):

    # read dataframe
    df = pd.read_csv(f_csv)

    # keep only documents that have text
    filtered_df = df[df[text_column].notnull()]

    # iterate over rows in dataframe
    for idx, row in filtered_df.iterrows():

        # read text and join lines (hard line-breaks)
        text = row[text_column].replace("\n", " ")

        # use all columns as metadata, except the column with the actual text
        metadata = row.to_dict()
        del metadata[text_column]

        yield (text, metadata)


# set correct path relative to working directory (folder where you saved this script)
f_csv = "materials/dataset_speeches_federal_council_2019.csv"

# stream the csv-dataset by calling the function defined above
texts = get_texts_from_csv(f_csv, text_column="Text")
# create a corpus with all the texts
corpus_speeches = textacy.Corpus(de, data=texts)

# task 5: two subcorpora
# define two functions filtering by language and period
# similar as the lambda functions shown in slides, yet may be better understandable


def filter_func_pre(doc):
    return doc._.meta.get("Sprache") == "de" and doc._.meta.get("Jahr") < 2000


# greater-equal to include the year 2000
def filter_func_post(doc):
    return doc._.meta.get("Sprache") == "de" and doc._.meta.get("Jahr") >= 2000


#########################################
# ALTERNATIVE task 5: filter by gender instead of period
# You just need to call these functions when creating the supcorpora below.
# Everything else keeps the same.
def filter_func_women(doc):
    return (
        doc._.meta.get("Sprache") == "de"
        and doc._.meta.get("Jahr") >= 1999
        and doc._.meta.get("Geschlecht") >= "f"
    )


def filter_func_men(doc):
    return (
        doc._.meta.get("Sprache") == "de"
        and doc._.meta.get("Jahr") >= 1999
        and doc._.meta.get("Geschlecht") >= "m"
    )


#########################################

# create two new subcorpora after applying filter function
subcorpus_pre = textacy.corpus.Corpus(de, data=corpus_speeches.get(filter_func_pre))
subcorpus_post = textacy.corpus.Corpus(de, data=corpus_speeches.get(filter_func_post))


# task 6: print number of docs for both subcorpora
print("# documents in Subcorpus 1 (before 2000):", subcorpus_pre.n_docs)
print("# documents in Subcorpus 2 (as of 2000):", subcorpus_post.n_docs)

# task 7: export the vocabulary of both subcorpora into file

# lowercased, unigram
vocab_pre = subcorpus_pre.word_counts(
    as_strings=True,
    normalize="lower",
    filter_stops=True,
    filter_punct=True,
    filter_nums=True,
    weighting="freq",  # get relative frequency instead of absolute
)
vocab_post = subcorpus_post.word_counts(
    as_strings=True,
    normalize="lower",
    filter_stops=True,
    filter_punct=True,
    filter_nums=True,
    weighting="freq",
)

# sort vocabulary by descending frequency
vocab_sorted_pre = sorted(vocab_pre.items(), key=lambda x: x[1], reverse=True)
vocab_sorted_post = sorted(vocab_post.items(), key=lambda x: x[1], reverse=True)

# write to file, one word and its frequency per line
fname = "exercises/exercise_3//vocab_frq_pre.txt"
with open(fname, "w") as f:
    for word, frq in vocab_sorted_pre:
        line = f"{word}\t{frq}\n"
        f.write(line)

fname = "exercises/exercise_3/vocab_frq_post.txt"
with open(fname, "w") as f:
    for word, frq in vocab_sorted_post:
        line = f"{word}\t{frq}\n"
        f.write(line)


### task 8: comparison of both vocabularies - changes? Which are the terms that are used most often?

# The top ten words look surprisingly similiar. Tradition seems to be reflected not only in the ritual itself but in language as well.
# At a second glance, there are interesting differences though:
# - speakers start to talk more about "europa" and "EU" after 2000
# - nowadays, the term "Eidgenossenschaft" is primarily used by right-wing people and got generally replaced by "Schweiz"
# - gender became important: greeting women as "Damen" besides "Herren"
# - "Sicherheit" becomes a hot topic after the relatively calm post-war period
# - increased talking about "Kultur", "Identität", "Werte". Who are we (no longer limited to Swiss people) in a globalized and multi-cultural world?

# To compare the vocabulary in a more systematic way than simple eye-balling,
# it helps to compute the relative change in frequency between the epochs.
# This goes beyond what we have touched upon in the seminar. Yet, it is worth to look at it.

# create dataframe for both subcorpora
df_pre = pd.DataFrame(vocab_sorted_pre, columns=["term", "frq"])
df_post = pd.DataFrame(vocab_sorted_post, columns=["term", "frq"])

# merge them into a single dataset on the basis of term
df = df_pre.merge(df_post, on="term", how="inner", suffixes=("_pre", "_post"))

# compute the relative difference and sort by it
df["diff"] = df["frq_post"] - df["frq_pre"]
df.sort_values("diff", inplace=True)

# show terms with biggest increase wtr to relative frequency
print(df.head(20))

# show terms with biggest increase wtr to relative frequency
print(df.tail(20))

# save the results as csv dataset
fname = "exercises/exercise_3/vocab_diff_periods.csv"
df.to_csv(fname)
