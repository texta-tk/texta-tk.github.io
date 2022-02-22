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

	.. _rakun_creation_gui:

GUI
==============

For creating a new Rakun Extractor, navigate to `"Models" -> "Rakun Extractors"` as seen in :numref:`rakun_navigation`.

.. _rakun_navigation:
.. figure:: images/rakun/rakun_navigation.png
	:width: 500pt
	:align: center

	*Rakun Extractor navigation*

If the navigation is successful, you should see a panel similar to :numref:`rakun_create_button` with `"Create"` button in the top left corner of the page.

.. _rakun_create_button:
.. figure:: images/rakun/rakun_create_button.png
	:width: 500pt
	:align: center

	*Rakun Extractor's creation button*

Clicking on the `"Create"` button opens a modal window with text `"New Rakun Extractor"` as depicted in :numref:`rakun_new_rakun`.

.. _rakun_new_rakun:
.. figure:: images/rakun/rakun_new_rakun.png
	:width: 500pt
	:align: center

	*Empty Rakun Extractor creation view*

Fill the required fields and click on the `"Create"` button in the bottom right corner of the window (:numref:`rakun_create_view`).

.. _rakun_create_view:
.. figure:: images/rakun/rakun_create_view.png
	:width: 500pt
	:align: center

	*Filled Rakun Extractor creation view*

The created Rakun Extractor can now be seen as the first (or only, if no previous Rakun Extractors exist under the project) row in the table of Rakun Extractors (:numref:`rakun_extractor_list`).

.. _rakun_extractor_list:
.. figure:: images/rakun/rakun_extractor_list.png
	:width: 600pt
	:align: center

	*List of Rakun Extractors.*

.. _rakun_creation_api:

API
==============

Endpoint **/projects/{project_pk}/rakun_extractors/**

Example:

.. code-block:: bash

	curl -X POST "http://localhost:8000/api/v1/projects/1/rakun_extractors/" \
	-H "accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
	-d '{
		    "description": "Test Rakun Extractor",
		    "distance_method": "editdistance",
		    "distance_threshold": 2,
		    "num_keywords": 15,
		    "pair_diff_length": 3,
		    "stopwords": ["and", "or", "if", "why", "when"],
		    "bigram_count_threshold": 3,
		    "min_tokens": 1,
		    "max_tokens": 2,
		    "max_similar": 3,
		    "max_occurrence": 10
		}'

Response:

.. code-block:: json

	{
	    "id": 38,
	    "url": "http://localhost:8000/api/v1/projects/1/rakun_extractors/38/",
	    "author_username": "test",
	    "description": "Test Rakun Extractor",
	    "distance_method": "editdistance",
	    "distance_threshold": 2.0,
	    "num_keywords": 15,
	    "pair_diff_length": 3,
	    "stopwords": [
	        "and",
	        "or",
	        "if",
	        "why",
	        "when"
	    ],
	    "bigram_count_threshold": 3,
	    "min_tokens": 1,
	    "max_tokens": 2,
	    "max_similar": 3,
	    "max_occurrence": 10,
	    "fasttext_embedding": null,
	    "task": null
	}

Usage
********

The following section covers the most important functionalities of Rakun Extractor.

Extract from text
===================

Function `"Extract from text"` extracts keywords from a single text with a selected Rakun Extractor model.

GUI
-----------

For extracting keywords with an existing Rakun Extractor model, navigate to `"Models" -> "Rakun Extractors"` as seen in :numref:`rakun_navigation`.

.. _rakun_extractor_list_v2:
.. figure:: images/rakun/rakun_extractor_list_v2.png
	:width: 500pt
	:align: center

	*List of existing Rakun Extractor models*

Select the model you wish to use and navigate to options panel denoted with three vertical dots as seen in :numref:`rakun_extractor_list_v2`.

.. _rakun_extract_from_text:
.. figure:: images/rakun/rakun_extract_from_text.png
	:width: 180pt
	:align: center

	*"Extract from text" option in the selection menu*

Select option "Extract from text" from the selection menu as seen in :numref:`rakun_extract_from_text`.


.. _rakun_extract_from_text_modal:
.. figure:: images/rakun/rakun_extract_from_text_modal.png
	:width: 500pt
	:align: center

	*Rakun Extractor's modal window*

Selecting the option opens a new modal window `"Extract From Text"`. Insert the text from where you wish to extract the keywords and click on the button `"Extract"` in the bottom right corner of the panel (:numref:`rakun_extract_from_text_modal`).


.. _rakun_extract_output:
.. figure:: images/rakun/rakun_extract_output.png
	:width: 500pt
	:align: center

	*Extracted keywords*



The results are displayed in the same modal window as seen in :numref:`rakun_extract_output`.


API
------------

Endpoint **/projects/{project_pk}/rakun/{id}/extract_from_text/**

Example:

.. code-block:: bash

		curl -X POST "http://localhost:8000/api/v1/projects/1/rakun_extractors/38/extract_from_text/" \
		-H "accept: application/json" \
		-H "Content-Type: application/json" \
		-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
		-d '{
			"text": "The Tallinn Urban Environment and Public Works Department has released a warning that the city's streets may become exceptionally slippery due to falling temperatures.  \"The difficult winter is coming to an end, but this sometimes makes the weather even more problematic. The rain, combined with sub-zero temperatures, will inevitably lead to dangerous icing conditions on both pathways and roads. All our partners will start de-icing at the first sign of icy roads, but unfortunately, it is simply not possible to do it everywhere at once. Therefore, we urge road users to be careful and remind property owners that granite aggregate is the best way for de-icing,\" Vladimir Svet (Center), Deputy Mayor of Tallinn said.",
			"add_spans": True
		  }'



Response:

.. code-block:: json

	{
	    "rakun_id": 38,
	    "desscription": "Test Rakun Extractor",
	    "result": true,
	    "text": "The Tallinn Urban Environment and Public Works Department has released a warning that the city's streets may become exceptionally slippery due to falling temperatures.  \"The difficult winter is coming to an end, but this sometimes makes the weather even more problematic. The rain, combined with sub-zero temperatures, will inevitably lead to dangerous icing conditions on both pathways and roads. All our partners will start de-icing at the first sign of icy roads, but unfortunately, it is simply not possible to do it everywhere at once. Therefore, we urge road users to be careful and remind property owners that granite aggregate is the best way for de-icing,\" Vladimir Svet (Center), Deputy Mayor of Tallinn said.",
	    "keywords": [
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "temperatures",
	            "spans": "[[154, 166]]",
	            "doc_path": "text",
	            "probability": 0.5953014184397163
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "temperatures",
	            "spans": "[[305, 317]]",
	            "doc_path": "text",
	            "probability": 0.5953014184397163
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "roads",
	            "spans": "[[391, 396]]",
	            "doc_path": "text",
	            "probability": 0.5048758865248227
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "roads",
	            "spans": "[[460, 465]]",
	            "doc_path": "text",
	            "probability": 0.5048758865248227
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "de-icing",
	            "spans": "[[426, 434]]",
	            "doc_path": "text",
	            "probability": 0.5048758865248227
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "de-icing",
	            "spans": "[[655, 663]]",
	            "doc_path": "text",
	            "probability": 0.5048758865248227
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "environment",
	            "spans": "[[18, 29]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "conditions",
	            "spans": "[[359, 369]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "released",
	            "spans": "[[62, 70]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "vladimir",
	            "spans": "[[666, 674]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "icing",
	            "spans": "[[353, 358]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "icing",
	            "spans": "[[429, 434]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "icing",
	            "spans": "[[658, 663]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "public",
	            "spans": "[[34, 40]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "department",
	            "spans": "[[47, 57]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "urban",
	            "spans": "[[12, 17]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "become",
	            "spans": "[[109, 115]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "exceptionally",
	            "spans": "[[116, 129]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "center",
	            "spans": "[[681, 687]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        },
	        {
	            "fact": "Test Rakun Extractor",
	            "str_val": "slippery",
	            "spans": "[[130, 138]]",
	            "doc_path": "text",
	            "probability": 0.41976950354609927
	        }
	    ]
	}
