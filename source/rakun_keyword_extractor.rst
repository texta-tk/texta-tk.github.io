`EN <https://docs.texta.ee/rakun_keyword_extractor.html>`_
`ET <https://docs.texta.ee/et/rakun_keyword_extractor.html>`_

.. _rakun_keyword_extractor:

##################
Rakun Extractor
##################

:ref:`Rakun Extractor <rakun_keyword_extractor_concept>` is a tool for extracting keywords from texts. The tool is based on an unsupervised graph-based method `RaKUn <https://github.com/EMBEDDIA/RaKUn>`_.



Creation
******************

.. _creation_parameters:

Parameters
============

The following section gives an overview of Rakun Extractor's input parameters.


.. _param_description:

**description**:
	Name of the Rakun Extractor model to easily distinguish it from the other Rakun instances with different parameters.

.. _param_distance_method:

**distance_method**:
	Method used while pruning the graph by merging similar words/phrases into a single node.

	Supported options:
		editdistance:
			Uses `Levenshtein distance <https://en.wikipedia.org/wiki/Levenshtein_distance>`_ for pruning the graph.
		fasttext:
			Uses a :ref:`FastText Embedding <embedding_concept>` for pruning the graph.

			.. note::

				To use a FastText embedding as a distance method, the embedding should be first trained using the :ref:`Embedding <embedding_concept>` app.




.. _param_distance_threshold:

**distance_threshold**:
	The maximum allowed difference between two words for being treated as different words. The words are merged, if the difference between them is lower than the set threshold. If the selected :ref:`distance_method <param_distance_method>` is `editdistance`, the threshold should be an integer and it will act as Levenshtein distance. If the selected :ref:`distance_method <param_distance_method>` is `fasttext`, the threshold should be a float in range [0, 1].

.. _param_num_keywords:

**num_keywords**:
	Maximum number of keywords that should be returned.

	.. note::

		The algorithm's efficiency doesn't depend on the number of keywords returned, so extracting 3 top keywords takes as much time as extracting 50 top keywords. As the probability of the keywords is also returned, it is usually more reasonable to set the number of extracted keywords higher and later filter out the most relevant ones, although it depends on the task.

.. _param_pair_diff_length:

**pair_diff_length**:
	The maximum difference in length for words to be considered as candidates for merging.

	.. note::

		NB! Pay attention to the relation with parameters :ref:`distance_method <param_distance_method>` and :ref:`distance_threshold <param_distance_threshold>`! For example, let's consider words "gift" and "present". If the value for `pair_diff_length` is set to 2, the words are automatically treated as different, because the difference in their length = 3 < 2, the value for `pair_diff_length`.


.. _param_bigram_count_threshold:

**bigram_count_threshold**:
	How frequently should a bigram be used in a text for it to be considered a bigram.



.. _param_min_tokens:

**min_tokens**:
	Minimum number of words in a keyword.

.. _param_max_tokens:

**max_tokens**:
	Maximum number of words in a keyword.


.. _param_max_similar:

**max_similar**:
	Maximum number of overlapping words allowed in bi- and trigrams.

	.. note::

		Used only, if the value of parameter :ref:`max_tokens <param_max_tokens>` is greater than 1.


.. _param_max_occurrence:

**max_occurrence**:
	Maximum frequency of a word/phrase for it to be considered as a possible keyword candidate.


.. _param_fasttext_embedding:

**fasttext_embedding**:
	A fasttext embedding used for pruning the results.

	.. note::

		Relevant only if the value for :ref:`distance_method <param_distance_method>` is "fasttext".

.. _param_stopwords:

**stopwords**:
	A list of words to ignore as potential keywords.

.. _param_ignore_case:
