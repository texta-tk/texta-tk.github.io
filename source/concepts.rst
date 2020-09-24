`EN <https://docs.texta.ee/concepts.html>`_
`ET <https://docs.texta.ee/et/concepts.html>`_

Main Concepts
========================

Here are described the main concepts related to TEXTA Toolkit (TTK).

Project
-------

Project is the main unit of access and management for datasets and resources (embeddings, text classifiers, etc.). A project is defined by its description, list of Elasticsearch indices related to the project (this is where the data is!), and a list of users who can access the project and it’s resources. All resources in TTK belong to some project and by adding or removing users, one can manage their access to the project.

Task
----

TEXTA Toolkit allows to build several different statistical models to process the text. The training process is initiated via TTK API or GUI, which results in creating of the object in TTK data model and starting the asynchronous training task. Tasks are data objects for keeping track of training progress of trainable statistical models.

.. _search_concept:

Search
------

One of the most central component in TTK is Search, which is used to define subsets of data for training text classification models and performing various aggregations. Search is managed via GUI and can contain one or more constraints on feature values (e.g. strings and dates). Documents matching the search criteria can be used in various actions/functionalities in TTK, e.g. extraction of relevant keywords, data summarisation and exploration, and training text classifiers.

.. _texta_fact:

Fact
----

In TTK text annotations are regarded as facts:

.. code-block:: bash

    {
        "doc_path": "content.text",
        "fact": "PER",
        "spans": "[[12, 24]]"
        "str_val": "Donald Trump"
    }

Facts are objects with following properties:

* fact - name for the annotation (e.g. PER, LOC, or any arbitrary string)

* str_val - string value for the annotation (e.g. "Donald Trump" for PER). Values don't need to match annotated text segmements.

* doc_path - path to the field containing the annotated string (e.g. "text", "text.author", "comment.text.author", etc.)

* spans - JSON string containing the start and end positions in the annotated string

Toolkit comes with several predefined fact names that are used by our Multilingual Processor:

.. _factnames:

+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| Label    | Meaning     | Comment                                                                                                                      |
+==========+=============+==============================================================================================================================+
| PER      | Persona     | Name of a person.                                                                                                            |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| ORG      | Organisation| Name of an organisation, gotten statistically.                                                                               |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| LOC      | Location    | Name of a location, gotten statistically.                                                                                    |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| COMPANY  | Company     | Names of company registered in Estonia, gotten from `Estonian Open Data <https://opendata.riik.ee/datasets/ariregister/>`_.  |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| ADDR     | Address     | Estonian address, gotten from `Estonian Open Data <https://opendata.riik.ee/datasets/aadressiandmed/>`_.                     |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| DRUG     | Drug        | Name of a medicine.                                                                                                          |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| SUBSTANCE| Substance   | Ingredient of a drug.                                                                                                        |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| EML      | E-mail      | E-mail address.                                                                                                              |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| PHO      | Phone       | Phone number.                                                                                                                |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+
| TEXTA_TAG| Own tag     | Tags we have trained in :ref:`the Taggers under Models <texttaggers>`                                                        |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+

	Table 1. *Predefined Fact Names used by Multilingual Processor*

It is important to notice that COMPANY and ADDR identify only companies and addresses registered in Estonian Open Data.
It won't tag any foreign company nor address while ORG and LOC identifies all of them.

.. _index_concept:

Index
-----

Index is a collection of documents in Elasticsearch. In Search output the table consists of all the suitable documents filtered out from that index and one row indicates a document.

.. _field_concept:

Field
-----

Each document is a collection of fields. Field is a separated piece of information in that document. For example, we can have an article with fields containing the text, the date of publishing, headline, etc.

.. _anonymizer_concept:

Anonymizer
-------------

TODO

.. _embedding_concept:

Embedding
---------

Embedding is a statistical model describing the distributional properties of words and phrases, which enables the computation of similarity between words and phrases.
In TTK, embeddings are used for finding contextually similar keywords to extend search results and building lexicons.
Furthermore, vectors from word embeddings can also be used in neural classification models in Texta Toolkit.
TTK currently only supports Word2Vec embeddings, but work is being done to incorporate state of the art embedding models (e.g. BERT from Google Research).
Furthermore, TTK will also employ cross-lingual embeddings developed by EMBEDDIA to support multilingual text classification.

.. _tagger_concept:

Tagger
------

Taggers are monolingual binary text classifiers used to predict tags for documents, e.g. whether a tweet is toxic or talking about Brexit.
Taggers are trained using a subset of documents defined by a TTK search or a raw Elasticsearch query (big ugly JSON object).
The subset of documents defines the “positive” set of examples (the documents about the topic being tagged), whilst “negative” examples will be selected automatically (to be unlike the positive ones).
TTK taggers are trained using scikit-learn pipelines and includes models like logistic regression and SVM.
TTK automatically splits the training data into training and testing data (by default 80-20) and applies grid search combined with k-fold cross validation to identify best hyperparameters.
SVM model is also used for feature selection to remove unimportant features from the model making it smaller.
For features, both word-based and character-based n-grams are used.

.. _regex_tagger_concept:

Regex Tagger
--------------

TODO


.. _tagger_group_concept:

Tagger Group
------------

Tagger Group is an extension to TTK’s binary taggers to support monolingual multi-label classification.
As its name suggests, Tagger Groups incorporate multiple (binary) taggers, which are executed in parallel to produce a list of tags to the user.
Tagger Group has been successfully tested with over 6000 binary models and prediction times are usually less than 1 second.
To achieve this, TTK has employed a hybrid approach for multi-label tagging, which uses unsupervised machine learning (document vectors) to limit the number of binary models used for prediction.
In such scenario input document is compared to training data to determine most probable models to produce valid tags.


.. _regex_tagger_group_concept:

Regex Tagger Group
-------------------

TODO


.. _torch_tagger_concept:

Torch Tagger
------------

While Taggers and Tagger Groups use classical machine learning to produce binary classification models, Texta Toolkit also incorporates deep neural models for binary and multi-class text classification.
As the models are all programmed using PyTorch, the TTK’s component is called Torch Tagger.
It allows for the user to use several state-of-art text classification models, including fastText, TextRNN using bi-direction LSTM networks, RCNN using recurrent convolutional neural nets.
Since all models have been developed using PyTorch, introducing new models is fairly straightforward.
TorchTagger models also include the possibility to use pre-trained word vectors (e.g. Word2Vec trained in TTK) in the embedding layer of the models.
To create data processing pipelines, Torch Tagger uses torchtext package.
Torch Tagger has been validated on monolingual toxic comment detection, reaching accuracy and F1-score of 96%.

Multilingual Processor
----------------------

TODO

.. _topic_analyzer_concept:

Topic Analyzer
--------------

Topic Analyzer is a tool that detects groups of similar documents in the data. It can be used for example to explore the structure of the unlabeled data in order to get the understanding about what it contains. However, the main purpose of the tool is to take it one step further and make actual use of one's exploration by transforming their discoveries into the labelling. It can then be used to build supervised machine learning models.

Topic Analyzer puts to use the best parts of unsupervised clustering and manual labelling. While clustering is a fast and efficient method to create groups of rather similar texts, it still lacks preciseness required to use these clusters as a labelling of the data. For example, while some clusters may indeed contain similar documents, some other will completely fail in capturing the similarity and most of them will probably be so-and-so.

Topic Analyzer allows user to look inside each cluster and make the decision about the quality manually. Users can also perform various actions on the cluster: remove documents, add more similar documents, and move documents to another more suitable cluster. Finally, user can choose to label the documents inside the cluster if it has reached a sufficient quality.
