# -*- coding: utf-8 -*-
from nltk.corpus import stopwords

stop_words = stopwords.words("english")

len(stop_words)

from nltk.stem.snowball import SnowballStemmer
stemmer = SnowballStemmer("english")