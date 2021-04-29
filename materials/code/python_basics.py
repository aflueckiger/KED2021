#!/usr/bin/env python
# coding: utf-8

# # Python Basics
# 
# ### The ABC of Computational Text Analysis (Spring 2021)
# ### BA-Seminar at University of Lucerne by Alex Flückiger

# ## Variables

# In[21]:


# define variable*
x = "at your service"
y = 2
z = ", most of the time."

# combine variables
int_combo = y * y  # for numbers any mathematical operation
str_combo = x + z  # for text only concatenation with +

# show content of variable
print(str_combo)


# ## Data Type Conversion

# In[22]:


# check the type
type(x)


# In[23]:


# convert types (similar for other types)
int('100')  # convert to integer
str(100)    # convert to string

# include variable in a f-string
x = 3
mixed = f"x has the value: {x}"
print(mixed)


# ## Assign vs. Compare

# In[24]:


# assign a value to a variable
x = 1
word = "Test"

# compare two values if they are identical
1 == 2  #  False
word == "Test"  # True


# ## iterate with for-loop

# In[25]:


sentence = ["This", "is", "a", "sentence"]

# iterate over each element
for token in sentence:

    # do something with the element
    print(token)


# ## condition with if-else statement

# In[26]:


sentence = ['This', 'is', 'a', 'sentence']

if len(sentence) == 3:
    print('This sentence has exactly 3 tokens')
elif len(sentence) < 5:
    print('This sentence has less than 5 tokens')
else:
    print('This sentence is longer than 5 tokens')


# ## Methods

# In[27]:


tokens = "This is a sentence".split(" ")  # split at whitespace
print(tokens, type(tokens))  # check the variable

tokens.append(".")  # add something to a list

tokens = " ".join(tokens)  # join elements to string
print(tokens, type(tokens))  # check the variable


# ## Functions

# In[28]:


# define a new function
def word_properties(word):
    """
    Print some properties of the provided word.
    It takes any string as argument (variable word).
    """

    # print(), len() and sorted() are functions themeselves
    word_length = len(word)
    sorted_letters = sorted(word, reverse=True)
    print(f"Properties for the word '{word}':")
    print("length:", word_length, "letters:", sorted_letters)

word_properties("computer") # call function with the word "computer"


# ## Indexing

# In[29]:


sentence =["This", "is", "a", "sentence"]

# element at position X
first_tok = sentence[0]  # 'This'
print(first_tok)

# elements of subsequence [start:end]
sub_seq = sentence[0:3]  # ['This', 'is', 'a']
print(sub_seq)

# elements of subsequence backwards
sub_seq_back = sentence[-2:]  # ['a', 'sentence']
print(sub_seq_back)

