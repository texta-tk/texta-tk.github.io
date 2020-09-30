#############
Tagger Group
#############

Tagger Group is for training multible classes at once and it also uses tags in the dataset given.

.. note::

    **How do Tagger and Tagger Groups differ?**
	One model predicts whether a text is positive (True) or negative (False). That is, whether this text get's the label or not. Tagger trains only one model and predicts whether a text is similar to the query/dataset it was trained on or not.
	Tagger Group trains several models at once. That means, it can predict several labels at once. Tagger Group trains on facts. We can have several values under a certain fact and for each value (if it has high enough frequency (*Minimum sample size*) a model is trained.

Creation
********

GUI
====

We can create a new Tagger Group model by clicking on the '+CREATE' button in the bottom-left. Then we must choose the name for the new Tagger Group (*Description*), the facts the model starts to learn on and the minimum sample size.

Our input will be the data under the project that is active (we can check it on the blue panel up-right). We have to select the fields the model learns from. If we choose two, the fields are just concatenated together before the learning process. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to it's lemma *eat* and are dealt as one word).

There's also an option to include our existing :ref:`embeddings <embedding>` into the training. 

Then we need to fine-tune the Tagger Group's classifiers by changing additional parameters such as
Vectorizer (possible feature extractors are: Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - read more about them `here <https://scikit-learn.org/stable/modules/feature_extraction.html>`_) and Classifier (`Logistic Regression <https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression>`_, `LinearSVC <https://scikit-learn.org/stable/modules/generated/sklearn.svm.LinearSVC.html>`_). We might get an error with LinearSVC in case we don't have enough data in the search.
We can set negative multiplier to change ratio of negative examples in the training set. We can use maximum sample size per class in case we want to limit the size of data the model trains on.

.. _figure-15:

.. figure:: images/create_tagger_group.png

    Figure 15. *Creating a Tagger Group*

Then we can hit create and see the training process and result of the tagger as seen in Figure 14.

.. _figure-16:

.. figure:: images/created_tagger_group.png
    :width: 100 %
    
    Figure 16. *Created Tagger Group*

Whenever we create new Tagger Group models, we can track it's progress from the table under *Task*. If we click on the job, we can see all the training info, how long did it took, and check how successful it was. Let's not forget that:
	1. Recall is the ratio of correctly labeled positives among all true positives. Avg.recall is the average of all the models' recalls.
	2. Precision is the ratio of correctly labeled positives among all instances that got a positive label. Avg.precision is the average of all the models' precisions.
	3. F1 score is the harmonic mean of these two and should be more informative expecially with unbalanced data. Avg.F1_score is the average of all the models' F1 scores.

API
====
Endpoint: **/projects/{project_pk}/tagger_groups/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/tagger_groups/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My tagger group",
                "fact_name": "TEEMA",
                "tagger":
                        {
                            "fields": ["comment_content_lemmas"],
                            "vectorizer": "TfIdf Vectorizer",
                            "classifier": "Logistic Regression",
                            "indices": [{"name": "texta_test_index"}]
                        }
            }'
            

Useage
*******

GUI
====
If we click on the three dots under *Edit*, we can see a list of extra actions to use.

*Models retrain* retrains all of the Tagger Group models with all the chosen parameters. It's useful in case our dataset changes or we have added some stop words.

*Models list* displays us the models the Tagger Group trained. We can inspect which kind of labels were trained.

*Tag text* is to check how does the model work. If we click on that, a window opens. We can paste there some text, choose to lemmatize it (necessary if our model was trained on a lemmatized text) and choose to use NER and post it. We then recieve the result (all the labels which model predicted True for this text) and the probability of this label being true. Probability shows how confident is this model in it's prediction. *Number of similar documents* is the number of most similar documents to the document in question. Tags given to these documents are tested on the document to be tagged.

*Tag doc* is similar to *Tag text*, except the input is in the json format. *Number of similar documents* is the number of most similar documents to the document in question. Tags given to these documents are tested on the document to be tagged.

*Tag random doc* takes a random instance from our dataset, displays it and returns the positive results of our models and the probability of these results being correct. 

*Delete* is for deleting the model.

In the table view we can also select several Tagger Groups and delete them all at once by clicking on the dustbin button next to the *+CREATE* button in the bottom-left. If we have several Tagger Groups, we can search for the right one by their description or task status. If we have models on several pages we can change pages in the bottom-right.

API
====

Tag text
----------

Endpoint: **/projects/{project_pk}/tagger_groups/{id}/tag_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/tagger_groups/1/tag_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "AINUS ettepanek - alla põhihariduse isikutele sõidulubasid mitte anda - sai kriitika osaliseks.",
                "lemmatize": true,
                "n_similar_docs": 10,
                "n_candidate_tags": 10
            }'

Response:

.. code-block:: json

        [
            {
                "tag": "foo",
                "probability": 0.6659222999240199,
                "tagger_id": 4,
                "result": true
            },
            {
                "tag": "bar",
                "probability": 0.5107991699285356,
                "tagger_id": 3,
                "result": true
            }
        ]
Application
************

Fine-Tuning
*************
