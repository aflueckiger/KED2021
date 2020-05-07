#!/usr/bin/env python
# coding: utf-8

"""
Seminar KED2020, week 10: NLP with Python
by Alex Flückiger


Have you ever wondered how the frequency of terms evolves over the years?
Or how the language differs between two groups of documents whereby
the groups may be formed by any metadata (person, organization, gender etc.)?

Exploring is most effective in an interactive and visual mode - so be it.
Among some basic statistics, this is the serious stuff where we finally arrive in our journey.
"""

import scattertext as st
import textacy.vsm
from plotnine import *
from pathlib import Path
import pandas as pd
import spacy
import textacy


# # Basic NLP

# define text directly (to read a file see below)
text = "Apple is looking at buying U.K. startup for $1 billion"

# load a language specific model
en = textacy.load_spacy_lang("en_core_web_sm")

# analyze document (tokenizing, tagging, parsing)
doc = textacy.make_spacy_doc(text, lang=en)

# iterate over tokens per document
for token in doc:
    print(
        token.text,
        token.lemma_,
        token.pos_,
        token.tag_,
        token.dep_,
        token.shape_,
        token.is_alpha,
        token.is_stop,
    )


# alternatively, read from a single txt file
f_text = "../materials/swiss_party_programmes/txt/sp_programmes/1920_parteiprogramm_d.txt"
text = textacy.io.read_text(f_text)

# show content
# special generator syntax as text is read just-in-time (streaming)
print(next(text))


# # Working with a Corpus

# # Create a Corpus I
#
# How to make a collection of texts?
#
# 1. index files
# 2. read file content
# 3. parse metadata from file name
# 4. return each document sequentially
#
# &rarr; wrap all this in a function `get_texts()`


def get_texts(dir_texts):
    """
    Sequentially stream all documents from a given folder,
    including metadata.
    """
    p = Path(dir_texts)  # set base dir

    # iterate over all documents
    for fname in p.glob("**/*.txt"):

        print("Parsing file:", fname.name)

        content = next(textacy.io.text.read_text(fname))
        # join lines as there are hard line-breaks
        content = content.replace("\n", " ")
        # further modify the text content here if needed

        # parse year from filename and set a metadata
        # example: 1920_parteiprogramm_d.txt --> year=1920
        try:
            year = int(fname.name.split("_")[0])
        except ValueError:
            print("WARNING: Parsing meta data failed:", fname.name)
            continue

        # add more metadata here if needed
        metadata = {"fname": fname.name, "year": year}

        # return documents one after another (sequentially)
        yield (content, metadata)


# # Create a Corpus II
#

# stream texts from a given folder
dir_texts = "../materials/swiss_party_programmes/txt/sp_programmes/"
texts = get_texts(dir_texts)

# load German language model
de = textacy.load_spacy_lang("de_core_news_sm")

# create corpus from processed documents
corpus = textacy.Corpus(de, data=texts)


# # Basic Corpus Statistics

print("# documents:", corpus.n_docs)
print("# sentences:", corpus.n_sents)
print("# tokens:", corpus.n_tokens)


# # Export Word Counts

# get lowercased and filtered corpus vocabulary
vocab = corpus.word_counts(
    as_strings=True, normalize="lower", filter_stops=True, filter_punct=True, filter_nums=True
)

# sort vocabulary by descending frequency
vocab_sorted = sorted(vocab.items(), key=lambda x: x[1], reverse=True)

# write to file, one word and its frequency per line
fname = "../analysis/vocab_frq.txt"
with open(fname, "w") as f:
    for word, frq in vocab_sorted:
        line = f"{word}\t{frq}\n"
        f.write(line)

vocab_sorted[:5]


# # Working with Subcorpus
#
# Interested in a group of documents only?

# function to filter by metadata, e.g. publication year after 1900
def filter_func(doc):
    return doc._.meta.get("year") > 1900


# create new corpus after applying filter function
subcorpus = textacy.corpus.Corpus(de, data=corpus.get(filter_func))

subcorpus.n_docs, corpus.n_docs


# select the first document in corpus
first_doc = corpus[0]
first_doc._.meta


# # Key Word in Context (KWIC)
#
# show words in their original context

# iterate over documents and print matches
# you can use regular expressions as keyword
for doc in corpus:
    results = textacy.text_utils.keyword_in_context(
        doc.text, keyword="(Ausland|Inland)", ignore_case=True, window_width=50, print_only=True
    )
    for match in results:
        print(doc.text)


# # Export Results to File
#
# collect any information and write to file

results = []

for doc in corpus:
    for sent in doc.sents:
        if "Armut" in sent.text:
            # match starts with the sentence, followed by the filename (tab-separated)
            match = f"{sent.text}\t{doc._.meta['fname']}"
            results.append(match)

fname = "../analysis/sents_poverty.txt"
with open(fname, "w") as f:
    f.write("\n".join(results))

print(match)


# # Export Corpus

# pretty complex syntax to
# merge metadata and actual content for each document in the corpus
data = [{**doc._.meta, **{"text": doc.text}} for doc in corpus]

# export corpus as csv
f_csv = "../analysis/corpus_party_programmes.csv"
textacy.io.csv.write_csv(data, f_csv, fieldnames=data[0].keys())


# # Explore Corpus interactively
#
# ![Example Scattertext](../analysis/viz_party_differences.png)

# # Scattertext
#
# - divide into subcorpus + rest by
#     - organization, person, gender, time etc.
# - find discriminative terms
#     - *unigrams* + *bigrams*
# - interactive exploring
# - scoring function *rank-frequency*
#     - normalized by number of terms [0,1]

# # Load CSV File
#
# load a dataset of 1 August speeches by Swiss federal councillors

# read dataset from csv file
f_csv = "../materials/dataset_speeches_federal_council_2019.csv"
df = pd.read_csv(f_csv)

# filter out non-german texts or very short texts
df_sub = df[(df["Sprache"] == "de") & (df["Text"].str.len() > 10)]

# make new column containing all relevant metadata (to show in plot)
df_sub["descripton"] = df_sub[["Redner", "Partei", "Jahr"]].astype(str).agg(", ".join, axis=1)

# sneak peek of dataset
df_sub.head()


# tags to ignore in corpus, e.g. numbers
censor_tags = set(["CARD"])

# stop words to ignore in corpus
de_stopwords = spacy.lang.de.stop_words.STOP_WORDS  # default stop words
custom_stopwords = set(["[", "]", "3."])
de_stopwords = de_stopwords.union(custom_stopwords)

# create corpus from dataframe
# lowercased terms, no stopwords, no numbers
# use lemmas for English only, German quality is too bad
corpus_speeches = (
    st.CorpusFromPandas(
        df_sub,
        category_col="Partei",
        text_col="Text",
        nlp=de,  # German model
        feats_from_spacy_doc=st.FeatsFromSpacyDoc(
            tag_types_to_censor=censor_tags, use_lemmas=False
        ),
    )
    .build()
    .get_stoplisted_unigram_corpus(de_stopwords)
)

# produce visualization (interactive html)
html = st.produce_scattertext_explorer(
    corpus_speeches,
    category="SP",  # set attribute to divide corpus into two parts
    category_name="SP",
    not_category_name="other parties",
    metadata=df_sub["descripton"],
    width_in_pixels=1000,
    minimum_term_frequency=5,  # drop terms occurring less than 5 times
    save_svg_button=True,
)

# write visualization to html file
fname = "../analysis/viz_party_differences.html"
open(fname, "wb").write(html.encode("utf-8"))


# # Plot Term Frequencies over Time
#
# ![Example](../analysis/rel_term_frq_nation.png)

# # Create Corpus III
#
# define new function to read from csv `get_texts_from_csv`


def get_texts_from_csv(f_csv, text_column):
    """
    Read dataset from a csv file and sequentially stream the rows,
    including metadata.
    """

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


f_csv = "../materials/dataset_speeches_federal_council_2019.csv"
texts = get_texts_from_csv(f_csv, text_column="Text")

corpus_speeches = textacy.Corpus(de, data=texts)


# pretty complex syntax to stream speeches per group
# define the kind of term information: lowercased, unigram, no stop words
tokenized_docs, groups = textacy.io.unzip(
    (
        doc._.to_terms_list(
            normalize="lower", ngrams=1, entities=False, as_strings=True, filter_stops=False
        ),
        doc._.meta["Jahr"],
    )
    for doc in corpus_speeches
)

# define type of freqency, here relative term frequency
vectorizer = textacy.vsm.GroupVectorizer(
    tf_type="linear",  # absolute term frequency
    apply_dl=True,  # normalized by document length
    dl_type="linear",
    vocabulary_grps=range(1950, 2019),
)  # only years from 1950 to 2019

# produce group-term-matrix with with frequency counts
grp_term_matrix = vectorizer.fit_transform(tokenized_docs, groups)

# create dataframe from matrix
df_terms = pd.DataFrame.sparse.from_spmatrix(
    grp_term_matrix, index=vectorizer.grps_list, columns=vectorizer.terms_list
)
df_terms["year"] = df_terms.index.values

# change shape of dataframe
df_tidy = df_terms.melt(id_vars="year", var_name="term", value_name="frequency")

# filter the dataset for the following terms
terms = ["volk", "schweiz", "nation"]
df_terms = df_tidy[df_tidy["term"].isin(terms)]

# plot the relative frequency for the terms above
p = (
    ggplot(df_terms, aes(x="year", y="frequency", color="term"))
    + geom_point()  # show individual points
    + stat_smooth(method="loess", span=0.2, se=False)  # overlay points with a smoothed line
    + theme_classic()
)  # make the plot look nicer


# check some other terms

terms = ["schweizer", "schweizerinnen"]
df_terms = df_tidy[df_tidy["term"].isin(terms)]

(
    ggplot(df_terms, aes("year", "frequency", color="term"))
    + geom_point(alpha=0.5, stroke=0)  # set transparency
    + stat_smooth(method="loess", span=0.2, se=False)
    + theme_classic()
)

# save as png
fname = "../analysis/rel_term_frq_gender.png"
p.save(filename=fname, dpi=150, verbose=False)
p


# check some other terms

terms = ["solidarität", "kultur", "werte"]

df_terms = df_tidy[df_tidy["term"].isin(terms)]

(
    ggplot(df_terms, aes("year", "frequency", color="term"))
    + geom_point(alpha=0.5, stroke=0)
    + stat_smooth(method="loess", span=0.2, se=False)
    + theme_classic()
)


# # Number of Documents per Year

df = pd.read_csv(f_csv)
docs_per_year = (
    df.groupby("Jahr").agg({"Text": "count"}).reset_index().rename(columns={"Text": "count"})
)

(
    ggplot(docs_per_year, aes(x="Jahr", y="count"))
    + geom_line(color="darkblue")
    + labs(title="Number of Speeches per Year", x="Year", y="Count")
    + theme_classic()
)


# # Outlook: NLP is on Fire 🔥
#
#
# - Named Entity Recognition (NER)
#   - *organizations, persons, locations, time etc.*
# - word embeddings
#   - *continious vectors instead of discrete symbols*
# - extract structured information
#   - *A does X to B*
# - train classifiers to predict

#
# # In-class: Exercises I
#
# 1. Make sure that your local copy of the Github repository KED2020 is up-to-date with `git pull`.
# You can find the code of this notebook as python script: `scripts/KED2020_10.py`
# along with the used dataset in `materials/dataset_speeches_federal_council_2019.csv`.
#
# 2. Open `scripts/KED2020_10.py` in Spyder.
#
# 3. Play around with the code is a good way to learn. Modify one thing, run the code, and see if the output matches your expectations.
#
# 4. Come up with your own terms for the KWIC and the frequency plot.
#
# 5. Getting bored? Check out the documentation of the packages linked above.
#
#
#
#
#
#

# # Resources
#
# #### tutorials on spaCy
#
# - [Official spaCy 101](https://spacy.io/usage/spacy-101)
#
# - [Hitchhiker's Guide to NLP in spaCy](https://www.kaggle.com/nirant/hitchhiker-s-guide-to-nlp-in-spacy)
