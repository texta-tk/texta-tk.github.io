#######
Tagger
#######

:ref:`Tagger <tagger_concept>` operates on saved searches and uses machine learning.

GUI
****

 We can create a new Tagger model by clicking on the '+CREATE' button in the bottom-left. Then we must choose the name for the new Tagger (*Description*) and the fields the model learns from. If we choose two, the fields are just concatenated together before the learning process. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to it's lemma *eat* and are dealt as one word).

If we leave *Query* empty, it will take all data in the active project as a input. We can also use saved searches as our desired input. This input will be our positive examples - later on we want to tag data similar to this one.
	
By setting these three, we can now train a classifier. However, we can also fine-tune the classifier by changing additional parameters such as
Vectorizer (Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - read more about them `here <https://scikit-learn.org/stable/modules/feature_extraction.html>`_) and Classifier (`Logistic Regression <https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression>`_, `LinearSVC <https://scikit-learn.org/stable/modules/generated/sklearn.svm.LinearSVC.html>`_). We might get an error with LinearSVC in case we don't have enough data in the search.
We can set negative multiplier to change ratio of negative examples. We can use maximum sample size per class in case we want to limit the size of data the model trains on.

Then we can hit create and see the training process and result of the tagger.

.. _figure-13:

.. figure:: images/create_tagger.png

    Figure 13. *Creating Bribe_tag tagger*


Whenever we create a new Tagger model, we can track it's progress from the table under *Task*. If we click on the job, we can see all the training info, how long did it took, and check how successful it was. Let's not forget that:
	1. Recall is the ratio of correctly labeled positives among all true positives.
	2. Precision is the ratio of correctly labeled positives among all instances that got a positive label.
	3. F1 score is the harmonic mean of these two and should be more informative expecially with unbalanced data.

If we click on the three dots under *Edit*, we can see a list of extra actions to use.

*List features* lists the word-features and their coefficients that the model used. Works with models that used Count Vectorizer or Tfldf Vectorizer since their output is displayable.

*Retrain tagger* retrains the whole tagger model with all the chosen parameters. It's useful in case our dataset changes or we have added some stop words.

*Stop words* is for adding stop words. Stop words are words that the model do not consider while looking for clues of similarities. It is wise to add most frequent words in the list like *am*, *on*, *in*, *are*. Separate the words with space (' '). 

*Tag text* is to check how does the model work. If we click on that a window opens. We can paste there some text, choose to lemmatize it (necessary if our model was trained on a lemmatized text) and post it. We then recieve the result (True if this text gets the tag and False otherwise) and the probability. Probability shows how confident is our model in it's prediction. 

*Tag doc* is similar to *Tag text*, except the input is in the json format. 

*Tag random doc* takes a random instance from our dataset, displays it and returns the result and the probability of this result being correct. 

*Delete* is for deleting the model.

In the table view we can also select several models and delete them all at once by clicking on the dustbin button next to the *+CREATE* button in the bottom-left. If we have several models, we can search for the right one by their description or task status. If we have models on several pages we can change pages in the bottom-right.


.. _figure-14:

.. figure:: images/tagger_result.png
    :width: 100 %

    Figure 14. *Bribe_tag tagger*


API
****

Train a new tagger
++++++++++++++++++

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
                "indices": [{"name": "texta_test_index"}]
            }'

Tag text
++++++++

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

