.. _tagger:
#######
Tagger
#######

:ref:`Tagger <tagger_concept>` operates on saved searches and uses machine learning.

.. note::

    **How do Tagger and Tagger Groups differ?**
	One model predicts whether a text is positive (True) or negative (False). That is, whether this text gets the label or not. Tagger trains only one model and predicts whether a text is similar to the query/dataset it was trained on or not.
	Tagger Group trains several models at once. That means, it can predict several labels at once. Tagger Group trains on facts. You can have several values under a certain fact and for each value (if it has high enough frequency (*Minimum sample size*) a model is trained.

Creation
**********

GUI
+++++

Create a new Tagger model by clicking on the 'CREATE' button in the top-left. Then choose the name for the new Tagger (*Description*), the indices and the fields the model learns from. If you choose two fields, the fields are concatenated together before the learning process. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to its lemma *eat* and are dealt as one word).

If *Query* is left empty, it will take all data in the active project as an input. You can also use saved searches as your desired input. This input will be the positive examples - later on, the Tagger tags data similar to this one.
	
By setting these three, you can now train a classifier. However, you can also fine-tune the classifier by changing additional parameters such as your previously trained :ref:`embedding <tembedding_concept>`, Vectorizer (Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - read more about them `here <https://scikit-learn.org/stable/modules/feature_extraction.html>`_) and Classifier (`Logistic Regression <https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression>`_, `LinearSVC <https://scikit-learn.org/stable/modules/generated/sklearn.svm.LinearSVC.html>`_). You can set the negative multiplier to change the ratio of negative examples. You can use the maximum sample size per class in case you want to limit the size of data the model trains on. After that, all that's left is hitting the "Create"-button (scroll down a bit), seeing the training process and the result of the tagger.

.. note::
	LinearSVC might give an error in case there's not enough data in the search.

.. _create_tagger:
.. figure:: images/create_tagger.png

    *Creating Bribe_tag tagger*


API
++++++++++

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


.. _tagger_usage:

Usage
*******

GUI
+++++

Whenever a new Tagger model is created, you can track its progress from the table under *Task*. If you click on the job, you can see all the training info, how long did it took, and check how successful it was. Let's not forget that:

	1. Recall is the ratio of correctly labeled positives among all true positives.
	2. Precision is the ratio of correctly labeled positives among all instances that got a positive label.
	3. F1 score is the harmonic mean of these two and should be more informative especially with unbalanced data.

The three dots under *Actions* gives you a list of extra actions to use.

*List features* lists the word-features and their coefficients that the model used. Works with models that used Count Vectorizer or Tfldf Vectorizer since their output is displayable.

*Stop words* is for adding stop words. Stop words are words that the model does not consider while looking for clues of similarities. It is wise to add the most frequent words in the list like *am*, *on*, *in*, *are*. Separate the words with space (' '). 

*Tag text* is to check how does the model work. If you click on that a window opens. You can paste there some text, choose to lemmatize it (necessary if your model was trained on a lemmatized text), and post it. You then receive the result (True if this text gets the tag and False otherwise) and the probability. Probability shows how confident is your model in its prediction. 

*Tag doc* is similar to *Tag text*, except the input is in the JSON format. 

*Tag random doc* takes a random instance from your dataset, displays it, and returns the result and the probability of this result being correct. 

*Edit* is for changing the description.

*Retrain tagger* retrains the whole tagger model with all the chosen parameters. It's useful in case your dataset changes or you have added some stop words.

*Delete* is for deleting the model.

In the table view, you can also select several models and delete them all at once by clicking on the dustbin button next to the *CREATE* button in the top-left. If you have several models, you can search for the right one by their description or task status. If you have models on several pages you can change pages in the top-right.


.. _tagger_result:
.. figure:: images/tagger_result.png
    :width: 100 %

    *Bribe_tag tagger*

API
++++

Endpoint **/projects/{project_pk}/taggers/{id}/tag_text/**

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

