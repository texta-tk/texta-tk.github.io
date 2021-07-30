`EN <https://docs.texta.ee/tagger.html>`_
`ET <https://docs.texta.ee/et/tagger.html>`_

##############
.. _tagger:

Tagger
##############

:ref:`Tagger <tagger_concept>` operates on saved searches and uses machine learning.

.. note::

    **How do Tagger and Tagger Groups differ?**
	One model predicts whether a text is positive (True) or negative (False). That is, whether this text gets the label or not. Tagger trains only one model and predicts whether a text is similar to the dataset it was trained on or not.
	Tagger Group trains several models at once. That means, it can predict several labels at once. Tagger Group trains on :ref:`facts <texta_fact>`. You can have several values under a certain fact and for each value (if it has high enough frequency (*Minimum sample size*) a model is trained.

Creation
**********

.. role:: raw-html(raw)
    :format: html


Parameters
===========

**description**:
	Name of the Tagger model, which is also used as name of the tag while tagging the documents.

**indices**:
	The indices the model learns from.

**fields**:
	The :ref:`fields <field_concept>` the model learns from. If more than one fields is chosen, the fields are concatenated together before the learning process. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to its lemma *eat* and are dealt as one word).

**query**:
	Searcher's :ref:`query <query_concept>` for the dataset to be trained on. If *Query* is left empty, it will take all data in the active :ref:`project <project_concept>` as an input. You can also use saved searches as your desired input. This input will be the positive examples - later on, the Tagger tags data similar to this one.

**embedding**:
	:ref:`embedding <embedding_concept>` previously trained on the same dataset.

**vectorizer**:
	Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - read more about them `here <https://scikit-learn.org/stable/modules/feature_extraction.html>`_.

**classifier**:
	`Logistic Regression <https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression>`_, `LinearSVC <https://scikit-learn.org/stable/modules/generated/sklearn.svm.LinearSVC.html>`_.

**maximum sample size**:
	*The maximum sample size* per class is for limiting the size of data the model trains on.

.. _param_minimum_sample_size:

**minimum_sample_size**:
	 Minimum number of positive examples.

**negative multiplier**:
	*The negative multiplier* is for changing the ratio of negative examples.

.. _param_fact_name:

**fact_name**:
	 Fact name used for **multiclass classification**. NB! The selected fact should have at least two unique values!

.. _param_pos_label:

**pos_label**:
	Fact value used as the positive label while calculating various evaluation scores like precision, recall and f1.

	.. note::

		Defining this parameter is necessary only, if:

		a\) param :ref:`fact name<param_fact_name>` is defined and :raw-html:`<br />`
		b\) the defined fact name has exactly two unique values.

.. _param_balance:

**balance**:
	Whether or not to balance the classes for **multiclass classification**. If this parameter is enabled, the examples for each class are sampled with repetitions until their size is either equal to

	a\) the size of the class with the largest number of examples (param :ref:`balance to max limit<param_balance_to_max_limit>` is disabled) or :raw-html:`<br />`
	b\) the max limit defined with parameter :ref:`maximum sample size<param_maximum_sample_size>` (param :ref:`balance to max limit<param_balance_to_max_limit>` is enabled).

	.. note::

		This parameter has effect only if param :ref:`fact name<param_fact_name>` is defined.

.. _param_balance_to_max_limit:

**balance_to_max_limit**:
	If enabled, the examples for each class are sampled with repetitions until the limit set with param :ref:`maximum sample size<param_maximum_sample_size>` is reached.

	.. note::

		This parameter has effect only if param :ref:`fact name<param_fact_name>` is defined and param :ref:`balance<param_balance>` is enabled.

.. _param_stopwords:

**stopwords**:
  List of words ignored while training the classifier.


.. _param_ignore_numbers:

**ignore_numbers**:
  If enabled, all the numbers in the text are ignored as possible features. It is advisable to enable this parameters, unless you know for certain that the numbers in the text convey meaningful information.

.. _param_snowball_language:

**snowball_language**:
  The language used by the Snowball stemmer.

  .. note::

    This param should be specified only if:

    a\) you wish to stem the data before feeding it to the classification models and :raw-html:`<br />`
    b\) the input data is monolingual (otherwise it is advisable to use the param :ref:`detect language <param_detect_lang>` instead).

.. _param_detect_lang:

**detect_lang**:
  If enabled, the language of each document is detected to select an appropriate stemmer.

  .. note::

    This should be selected only if:

    a\) you wish to stem the data before feeding it to the classification models and :raw-html:`<br />`
    b\) the input data is multilingual (otherwise it is advisable to use the param :ref:`snowball language <param_snowball_language>` instead).

.. _param_scoring_function:

**scoring_function**:
  Specifies the score used while selecting the best model with k-fold cross-validation. Available options are:

  - "precision"
  - "recall"
  - "f1_score"
  - "accuracy"
  - "jaccard"

.. _param_score_threshold:

**score_threshold**:
  Elasticsearch score threshold for filtering out irrelevant examples. All examples below first document's score * score threshold are ignored. Float between 0 and 1. Default: 0.0




GUI
====

Create a new Tagger model by clicking on the 'CREATE' button in the top-left. Then choose the parameters. After that, all that's left is hitting the "Create"-button (scroll down a bit), seeing the training process and the result of the tagger.

.. note::
	LinearSVC might give an error in case there's not enough data in the search.

.. _create_tagger:
.. figure:: images/tagger/create_tagger.png

    *Creating Bribe_tag tagger*

Whenever a new Tagger model is created, you can track its progress from the table under *Task*. If you click on the job, you can see all the training info, how long did it took, and check how successful it was. Let's not forget that:

	1. Recall is the ratio of correctly labeled positives among all true positives.
	2. Precision is the ratio of correctly labeled positives among all instances that got a positive label.
	3. F1 score is the harmonic mean of these two and should be more informative especially with unbalanced data.

The three dots under *Actions* gives you a list of extra actions to use.

In the table view, you can also select several models and delete them all at once by clicking on the dustbin button next to the *CREATE* button in the top-left. If you have several models, you can search for the right one by their description or task status. If you have models on several pages you can change pages in the top-right.

.. _tagger_result:
.. figure:: images/tagger/tagger_result.png
    :width: 100 %

    *Bribe_tag tagger*


API
====

Endpoint: **/projects/{project_pk}/taggers/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/taggers/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My tagger",
                "fields": ["comment_content_lemmas"],
                "vectorizer": "Hashing Vectorizer",
                "classifier": "Logistic Regression",
                "indices": [{"name": "texta_test_index"}],
                "stop_words": "",
            	"maximum_sample_size": 10000,
            	"score_threshold": 0.0,
            	"negative_multiplier": 1,
            }'

The trained tagger endpoint: **/projects/{project_pk}/taggers/{id}/**

.. _tagger_usage:

Usage
*******


List features
===============

*List features* lists the word-features and their coefficients that the model used. Works with models that used Count Vectorizer or Tfldf Vectorizer since their output is displayable.

API endpoint: **/projects/{project_pk}/taggers/{id}/list_features/**

Stop words
============
*Stop words* is for adding stop words. Stop words are words that the model does not consider while looking for clues of similarities. It is wise to add the most frequent words in the list like *am*, *on*, *in*, *are*. Separate the words with space (' ').

.. _stop_words:
.. figure:: images/tagger/stop_words.png
    :width: 100 %

    *Adding stop words*

API endpoint **/projects/{project_pk}/taggers/{id}/stop_words/**

Tag text
==========
*Tag text* is to check how does the model work. If you click on that a window opens. You can paste there some text, choose to lemmatize it (necessary if your model was trained on a lemmatized text), and post it. You then receive the result (True if this text gets the tag and False otherwise) and the probability. Probability shows how confident is your model in its prediction.

.. _tag_text:
.. figure:: images/tagger/tag_text.png
    :width: 100 %

    *Tagging a random written/pasted text*

API endpoint **/projects/{project_pk}/taggers/{id}/tag_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/taggers/2/tag_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "mis su nimi on?",
                "lemmatize": true
            }'

Response:

.. code-block:: json

        {
            "tag":"My tagger",
            "probability":0.9898217973842874,
            "tagger_id":2,
            "result":true
        }


Tag doc
=========
*Tag doc* is similar to *Tag text*, except the input is in the JSON format.

.. _tag_doc:
.. figure:: images/tagger/tag_doc.png
    :width: 100 %

    *Tagging a random written/pasted text in json format*

API endpoint **/projects/{project_pk}/taggers/{id}/tag_doc/**

Tag random doc
=================
*Tag random doc* takes a random instance from your dataset, displays it, and returns the result and the probability of this result being correct.

API endpoint **/projects/{project_pk}/taggers/{id}/tag_random_doc/**

Edit
=====
*Edit* is for changing the description. Only in GUI.


Retrain tagger
==============
*Retrain tagger* retrains the whole tagger model with all the chosen parameters. It's useful in case your dataset changes or you have added some stop words. Only in GUI.

Delete
========

*Delete* is for deleting the model. Only in GUI.
