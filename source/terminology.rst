############
Terminology
############

Here are described the main concepts related to TEXTA Toolkit (TTK).

.. _anonymizer_concept:

Anonymizer
**********

Anonymizer is a tool for anonymizing names in a text based on a predefined list of names. Each name detected from the text will be substituted with randomly generated pair of initials. You can read more about it :ref:`here <anonymizer>`.

.. _bert_tagger_concept:

Bert Tagger
************

Bert Tagger uses Google's state-of-the-art `Bidirectional Encoder Representations from Transformer <https://arxiv.org/abs/1810.04805>` for word embeddings. Read more about its Toolkit implementation :ref:`here <bert_tagger>`.

.. _dataset_importer_concept:

Dataset Importer
*****************

Dataset Importer is a tool for conveniently uploading files into Elasticsearch to make them accessible for the Toolkit. Read more about the usage :ref:`here <dataset_importer>`.

.. _elasticsearch:

Elasticsearch
**************

Elasticsearch is a distributed, open source search and analytics engine and database for all types of data. You can read more about it `here <https://www.elastic.co/what-is/elasticsearch>`_.

.. _embedding_concept:

Embedding
**********

`Embedding <https://en.wikipedia.org/wiki/Word_embedding>`_ is a statistical model describing the distributional properties of words and phrases, which enables the computation of similarity between words and phrases.
In TTK, embeddings are used for finding contextually similar keywords to extend search results (by building lexicons).
Furthermore, vectors from word embeddings can also be used in neural classification models (:ref:`Taggers <tagger_concept>`, :ref:`Tagger Groups <tagger_group_concept>`, :ref:` Torch Tagger <torch_tagger_concept>`, :ref:`Taggers <bert_tagger_concept>`) in Texta Toolkit.
TTK will also employ cross-lingual embeddings developed by EMBEDDIA to support multilingual text classification.

.. _texta_fact:

Fact
********

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
| TEXTA_TAG| Own tag     | Tags we have trained in the Taggers under Models                                                                             |
+----------+-------------+------------------------------------------------------------------------------------------------------------------------------+

	Table 1. *Predefined Fact Names used by Multilingual Processor*

It is important to notice that COMPANY and ADDR identify only companies and addresses registered in Estonian Open Data.
It won't tag any foreign company nor address while ORG and LOC identifies all of them.

.. _field_concept:

Field
********

Each document is a collection of fields. Field is a separated piece of information in that document. For example, we can have an article with fields containing the text, the date of publishing, headline, etc.


.. _health_concept:

Health
******
Server health is a comprehensive overview of the status and performance of individual servers. It includes hardware parameters and, in our case, the TTK version numbers and the state of needed services. See :ref:`here <health>` how to check TTK's health.

.. _index_concept:

Index
********

`Elasticsearch's index <https://www.elastic.co/blog/what-is-an-elasticsearch-index>`_ is a collection of documents in Elasticsearch. In Search output the table consists of all the suitable documents filtered out from that index and one row indicates a document.

.. _lexicon_miner_concept:

Lexicon miner
*************
Lexicon Miner is a tool for creating topic-related lexicon. It uses :ref:'embeddings <embedding_concept>' for finding words used in similar context. Read more about its usage :ref:`here <lexiconminer>`.


.. _mlp:

Multilingual Preprocessor (MLP)
*******************************

MLP offers different analyzing options that give more features (information) for machine learning applications in TTK and helps to parse the information out of textual data user is interested in. Read more about the usage :ref:`here <mlp_p>`.

.. _project_concept:

Project
********

Project is the main unit of access and management for datasets and resources (embeddings, text classifiers, etc.). A project is defined by its description, list of Elasticsearch indices related to the project (this is where the data is!), and a list of users who can access the project and it’s resources. All resources in TTK belong to some project and by adding or removing users, one can manage their access to the project.

Project is active when it is chosen in the upper panel on the right. Read more about projects :ref:`here <project>`.

.. _query_concept:

Query
******

`Elasticsearch's query <https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html>`_ is basically a little json command that retrieves objects with given attributes from Elasticsearch. It can be thought of as subset of the dataset the query is performed on. Queries can be used in various Toolkit's tools and it can be saved under the :ref:`Searcher <search_concept>` as saved search for using it later or in other tools.

.. _regex_tagger_concept:

Regex Tagger
*************

Regex Tagger is a tool for tagging texts based on pattern matches. The user can define patterns (words/phrases/regexes) to search from the text and fine tune a variation of parameters to extract specific information and tag the text based on the information retrieved. Read more about its usage :ref:`here <regex_tagger>`.

.. _regex_tagger_group_concept:

Regex Tagger Group
************************

Regex Tagger Group allows combining different Regex Taggers. Read more about its usage :ref:`here <regex_tagger_group>`.

.. _reindexer_concept:

Reindexer
*********

Reindexer is a tool for making copies or subsets of Elasticsearch :ref:`indices <index_concept>`. Reindexer can be used for various data management tasks:

- Making a copy of an index;
- Merging multiple indices into one;
- Making a random subset of an index;
- Making a subset based on predefined query;
- Renaming fields;
- Updating Elasticsearch field types.

Read more about it :ref:`here <reindexer>`.


.. _search_concept:

Search
********

One of the most central component in TTK is Search, which is used to define subsets of data for training text classification models and performing various aggregations. Search is managed via GUI and can contain one or more constraints on feature values (e.g. strings and dates). Documents matching the search criteria can be used in various actions/functionalities in TTK, e.g. extraction of relevant keywords, data summarisation and exploration, and training text classifiers. Read more about it :ref:`here <searcher>`.

.. _tagger_group_concept:

Tagger Group
****************

Tagger Group is an extension to TTK’s binary taggers to support monolingual multi-label classification.
As its name suggests, Tagger Groups incorporate multiple (binary) taggers, which are executed in parallel to produce a list of tags to the user.
Tagger Group has been successfully tested with over 6000 binary models and prediction times are usually less than 1 second.
To achieve this, TTK has employed a hybrid approach for multi-label tagging, which uses unsupervised machine learning (document vectors) to limit the number of binary models used for prediction.
In such scenario input document is compared to training data to determine most probable models to produce valid tags. 
Read more about it :ref:`here <tagger>`.

.. _tagger_concept:

Tagger
********

Taggers are monolingual binary text classifiers used to predict tags for documents, e.g. whether a tweet is toxic or talking about Brexit.
Taggers are trained using a subset of documents defined by a TTK search or a raw Elasticsearch query (big ugly JSON object).
The subset of documents defines the “positive” set of examples (the documents about the topic being tagged), whilst “negative” examples will be selected automatically (to be unlike the positive ones).
TTK taggers are trained using scikit-learn pipelines and includes models like logistic regression and SVM.
TTK automatically splits the training data into training and testing data (by default 80-20) and applies grid search combined with k-fold cross validation to identify best hyperparameters.
SVM model is also used for feature selection to remove unimportant features from the model making it smaller.
For features, both word-based and character-based n-grams are used.
Read more about it :ref:`here <tagger_group>`.

.. _task:

Task
********

TEXTA Toolkit allows to build several different statistical models to process the text. The training process is initiated via TTK API or GUI, which results in creating of the object in TTK data model and starting the asynchronous training task. Tasks are data objects for keeping track of training progress of trainable statistical models.

.. _topic_analyzer_concept:

Topic Analyzer
****************

Topic Analyzer is a tool that detects groups of similar documents in the data. It can be used for example to explore the structure of the unlabeled data in order to get the understanding about what it contains. However, the main purpose of the tool is to take it one step further and make actual use of one's exploration by transforming their discoveries into the labelling. It can then be used to build supervised machine learning models.

Topic Analyzer puts to use the best parts of unsupervised clustering and manual labelling. While clustering is a fast and efficient method to create groups of rather similar texts, it still lacks preciseness required to use these clusters as a labelling of the data. For example, while some clusters may indeed contain similar documents, some other will completely fail in capturing the similarity and most of them will probably be so-and-so.

Topic Analyzer allows user to look inside each cluster and make the decision about the quality manually. Users can also perform various actions on the cluster: remove documents, add more similar documents, and move documents to another more suitable cluster. Finally, user can choose to label the documents inside the cluster if it has reached a sufficient quality.

Read more about its usage :ref:`here <topic_analyzer>`.

.. _torch_tagger_concept:

Torch Tagger
****************

While Taggers and Tagger Groups use classical machine learning to produce binary classification models, Texta Toolkit also incorporates deep neural models for binary and multi-class text classification.
As the models are all programmed using PyTorch, the TTK’s component is called Torch Tagger.

It allows for the user to use several state-of-art text classification models, including fastText, TextRNN using bi-direction LSTM networks, RCNN using recurrent convolutional neural nets.
Since all models have been developed using PyTorch, introducing new models is fairly straightforward.
TorchTagger models also include the possibility to use pre-trained word vectors (e.g. Word2Vec trained in TTK) in the embedding layer of the models.
To create data processing pipelines, Torch Tagger uses torchtext package.
Torch Tagger has been validated on monolingual toxic comment detection, reaching accuracy and F1-score of 96%.
Read more about its usage :ref:`here <torch_tagger>`.

.. _uaa_concept:

UUA server
**********
User Account and Authentication is an identity management service for making sure that only selected users have access to certain datasets. Read more about it :ref:`here <uua>`.
