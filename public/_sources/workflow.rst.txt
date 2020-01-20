Using TEXTA Toolkit
===================

This is version 2.0 documentation.

First steps
------------------

The login screen
++++++++++++++++

After starting up TEXTA, as described in the :ref:`installation step <running-texta>`, the next intuitive thing is to start using it.
Since it is a web application, we have to navigate to the corresponding address in our browser
(e.g. `http://localhost:8000/ <http://localhost:8000/>`_ if running locally or `https://live.texta.ee/ <https://live.texta.ee/>`_ if running on Texta's server). We are welcomed by a login page as depicted in Figure 1.1.

.. _figure-1:

.. figure:: images/01_register.png

    Figure 1.1. *Register*
    
    1. Register
    2. Log in

Login page allows to login, as well as to register. 

.. note::

    When starting up the TEXTA instance for the first time, it is crucial to create the superuser account (:ref:`installation's final touches <final-touches>`).
	The supersuser account is used to set up TEXTA and it's features to all other users.


After the login
++++++++++++++++

After the login we can see several options from the upper panel. We can see :ref:`our projects <projects>` (also projected as the home page) and we can work with our projects via :ref:`Search <searcher>`, :ref:`Lexicons <lexicons>`, :ref:`Models <models>` and :ref:`Tools <tools>`.

.. _figure-2:

.. figure:: images/02_homepage.png

    Figure 2. *Home page*
    
    1. :ref:`Projects <projects>`
    2. :ref:`State of the Toolkit's server <serversstate>`
    3. :ref:`Search <searcher>`
    4. :ref:`Lexicons <lexicons>`
    5. :ref:`Models <models>`
    6. :ref:`Tools <tools>`
    7. Active project
    8. User

.. _serversstate:

The state of the Toolkit's server
----------------------------------

On the Projects page (also Toolkit's home page) we can see technical info of Texta Toolkit's server on the right. There are four labels that indicate the state of the Toolkit. Blue labels *ElasticSearch Online* and *MLP Online* show that the backend is working properly and ElasticSearch and MLP are running. Red labels *ElasticSearch OFFLINE* and *MLP OFFLINE* indicate that the ElasticSearch or MLP is down and not working properly. Label *API VERSION 2.2.24* shows the backend version and label *VERSION 1.3* shows the frontend version.

We can also check how much disk space, memory and CPU is used up. If it's close to 100% the circle will turn red. Below the usage circles we can check how many cached models, active tasks and GPUs do we have.

This info might be needed when we start working on our projects and want to check if our model trainings or other jobs are running properly.

.. _projects:

Managing projects
------------------

**A project** is the dataset we are working on and all of it's resources. Resources are :ref:`lexicons <lexicons>`, :ref:`saved searches <savedsearches>`, :ref:`embeddings <embeddings>`, :ref:`taggers <texttaggers>`, etc (these will be explained below). We can think of the resources as the outputs of different tools we can play with in Texta Toolkit 2.0 or all the info regarding to the dataset.

Creating a project
+++++++++++++++++++

But first we must have a project. We can create a project by clicking the *+CREATE* button. We can then give it a title, select users who can work on the project and, of course, select the dataset. 

Afterwards we can see the created new project in the list and can change **the indices** (which are basically the datasets in ElasticSearch) and users via Edit.

Using a project
+++++++++++++++++++

In order to work with our project (search info, train taggers) we have to select it from the upper panel next to our user name. 

.. _searcher:

Searcher: Explore the Data
---------------------------


The Searcher application is responsible for both creating the searches for Toolkit's other applications and browsing-summarizing the data.

.. note::
	In order to use *Search*, project must be selected in upper panel.

Searcher's graphical interface consists of serveral important panels, which are depicted in figure XX.XX. You can collapse or open the panels by clicking on the arrow in the corner.

    Figure 9.1. *Searcher's first look*
    
    1. Current Search
    2. Saved Searches
    3. Aggregations
    4. Results

Current Search
++++++++++++++++

Data browsing and summarization depend on searches. Search consists of a set of constraints on field values. We can define our constraints on the data using the *Current Search* panel. Without saving the constraints, we are in a “test mode”, which means that we can use the search in Searcher, but we cannot use the search in other tools. After :ref:`saving the search <savedsearches>`, it is available also to other tools.

In order to add a constraint, we must first choose one or several fields. After the field is selected, we can then specify which textual tokens (words or word parts) should or must occur in the interested document subset.

We must notice that the search will be done on the Project's dataset chosen in the upper panel. We will search documents with the article_text_mlp.text field.

Suppose we are interested in finding all the documents which contains “bribery” and “official” from a text.

Figure 9.3 shows how we have defined that we want to find all the documents which contain “bribery” and “official” in the article_text_mlp.text field. We can also choose ‘or’ or ‘not’ under the Operator. In this case we either get documents containing at least one of the words (‘or’) or definitely not containing the words listed (‘not’).

“word” means that we want to find exact matches of the word(s) written and “phrase” means that we want to find exact matches of the phrases we are looking for, whereas “Phrase prefix” matches prefixes. This means suffixes may differ: for example searching for ‘bribe’ will find ‘bribetaking’, ‘bribers’, ‘bribery’ and other words starting with ‘bribe’. 'regex' takes the input as `a regular expression <https://www.rexegg.com/regex-quickstart.html>`_ and searches document accordingly. For example 'bribe.{0,2}' will find 'bribe' and 'bribery', but not longer words. If we have a big list of words we want to search for, we can extend the field searcher's panel.

We can also use Slop. Via Slop we can define up to how many words can be between the two words we wrote on one row in case the range is important for us. For example Figure 9.4 results in documents containing phrases like …today with Estonia, and Today Tallinn , Estonia , will host...

Knowing all that we can modify our first bribery search as shown in the Figure 9.5 below and get all instances, where’s a word or are words starting with ‘bribe’ (let’s suppose we lost interest in words starting with ‘offic’). In case we are interested only in word ‘bribe’ it is worth choosing to search within the lemma field, where you can filter out the exact word without worrying about it’s inflection (bribes lemma is still bribe).

Should we be interested in more detailed searches, we can add more constraints like the previous one via ‘Add Filter’.

We can also search documents in a certain date range in case we have a proper preprocessed date field. See example in Figure 9.6. We won’t do it at the moment.

If we click on “Search” button, we will see the matching data in a tabular form (see Figure 9.9), where layered features share feature name’s prefix, and matches are highlighted in pink. The results might be updating while modifying the filters.

If there are too many features (columns), we can hide or show them from the drop-down menu in the down left corner. We can select or deselect all of them together (*Select all*) or by clicking on them saparately. We can also hide or get back the Searcher's panels with *Toggle drawer* button. We can browse through Searcher's results with the arrows in the bottom right. We can also choose how many items per page would we want to see.


After we have come up with a suitable search, we can save it for later uses.

.. _savedsearches:

Saved Searches
+++++++++++++++

Searches can be saved with clicking on the save icon next to *Current Search* title (see Figure 9.10). If we save our “bribe” search under “bribery”, we can see it being listed in *Saved Searches* panel.

Now, whenever we check it, we can use it to browse data or apply in :ref:`summarization<aggregations>`. We can also send our saved search to other users who have the permission to our project with a copied url. This opens the saved search under the Current Search for the other user. We can also open our saved search in the Current Search simply by clicking on it.

.. _aggregations:

Aggregations: Summarizing data
+++++++++++++++++++++++++++++++

As fun as browsing through the data is, it is not always enough. Sometimes we want to get an overview of our data, such as topics over time or word distributions. Searcher allows to do all of that and more through the “Aggregations” panel.

Aggregations have two components - data and features it aggregates over. It will aggregate over the dataset we have under the Current Search. We can also exclude current search (meaning that 'Aggregate over all data except the one we have currently active') and choose the aggregation size. By defining a feature, we can group by that feature and get category counts. For example, lets assume we are interested in seeing how are the top words distributed in our sample data defined by our “bribe” search. For that we simply click on our bribe search under Saved Searches to get it as the current search. By requesting aggregation as shown on Figure 9.15, we get the result on the same figure.

From the results in Figure 9.15 we can see raw word distributions for “bribe” search. Since we queried significant words, we can see that in the top are the words that we actually looked for in our saved search. We can change “Aggregations” setting to significant items or frequent items in order to get significant (by normalised count) or frequent (by count) items. If we want, we can hide current search in results.

.. note::

    **How are the significance scores calculated?**
	The numbers returned for scores are primarily intended for ranking different suggestions sensibly rather than something easily understood by end users. The scores are derived from the doc frequencies in foreground and background sets. In brief, a term is considered significant if there is a noticeable difference in the frequency in which a term appears in the subset and in the background. The way the terms are ranked can be configured, `see "Parameters" section <https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-significanttext-aggregation.html>`_.

One cool thing we can also do, is to visualize the frequency of texts with searched words in it on a timeline. We can do that if we have a proper date field (in Texta date format) in our data. Here we can visualize when were the words 'bribe', 'bribery' and 'bribed' used most frequently in our dataset.

We can also aggregate over texta_facts field in order to see the top entities under some tag. If we click on the black diagram button, we can scroll through the results. We see as many entities as we chose for our aggregation size.

Tags we can have under texta_facts are:

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

	Table 9.1. *Meaning of tags*
	
It is important to notice that COMPANY and ADDR identify only companies and addresses registered in Estonian Open Data. It won't tag any foreign company nor address while ORG and LOC identifies all of them.

.. _lexicons:

Lexicons: create topic-related lexicons
-----------------------------------------

In order to use lexicons, we must have :ref:`Embeddings model <embeddings>` trained. We can start creating topic-related lexicons.

Let’s create a lexicon that contains verbs accompanied with “bribery”.

After clicking on the newly created lexicon, we have to provide some seed words like 'accuse'.

The process of creating (or expanding) the lexicon is iterative. We keep asking for suggestions and from those we have to pick the ones that make sense to us. We keep asking for suggestions until we get no more meaningful responses. 

To add a suitable word to the lexicon, we simply have to click on it. If we want to delete something we already chose we can erase the verb from the list.

When we’re ready, we can save the lexicon.

.. _models:

Models
-------

Under the *Models* option on the upper panel we can use different taggers and create embeddings.

.. _embeddings:

Embeddings
++++++++++

Embeddings are basically words converted into numerical data (into vectors) that are more understandable and usable for the machine than plain strings (words). With these vectors created, we can compare words and find similar ones. We need embeddings to create, for example, :ref:`lexicons <lexicons>`. Texta Toolkit uses word2vec embeddings with `collocation detection <https://radimrehurek.com/gensim/models/phrases.html>`_. It means that the vectors are created on words and phrases. Phrases are chosen with collocation detection which finds often together occuring words and marks them as phrases. 

We can create a new embedding by clicking on the '+CREATE' button in the bottom-left. Then we must choose the name for the new embedding (*Description*). If we leave *Query* empty, it will take all data in the active project as a input. We can also use :ref:`saved searches <savedsearches>` as our desired input. Then we must choose the fields the embedding learns from. Embedding needs textual data, so we have to choose fields with text or lemmatized text in it. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to it's lemma *eat*).

Then we have to choose the number of dimensions. That means the length of the vectors created. 100-200 dimensions is usually a good place to start with. The minimum frequency defines how many times a word or a phrase has to occur in the data in order to get it's very own word/phrase vector. Rare words/phrases won't have very informative and usable vectors. Minimum frequency of 5 can be left as default if we are not sure of what to use.

Keep in mind that the bigger the data, the better results!

After creating the new embedding we can view the learning process and results in the embeddings' table. We can see which user created this embedding in this project, the name of the embedding model, field(s) it was trained on, the time it took to train, dimensions, minimum frequency and created vocabulary size. By clicking on the new model's row we can see similar info again. 

Three dots under *Edit* gives us access to deleting the embedding model or using *Phrase*. *Phrase* is a feature that helps us to check which phrases occur in the embedding model as vectors on their own. It outputs the words and connects phrases with '_'. For example,

TODO: ADD EXAMPLE HERE!


.. _texttaggers:

Tag the data!
--------------

Different Taggers in Texta Toolkit are classification models which can classify new data with the label/class the model is trained on. We can apply the tagger via API. 

We have four ways to train a tagger:

	1. :ref:`Tagger Groups <taggergroups>`
	2. :ref:`Taggers <taggers>`
	3. :ref:`NeuroTaggers <neurotaggers>`
	4. :ref:`TorchTaggers <torchtaggers>`

Only *Tagger* can be trained with saved searches. Others learn their models on tags in the dataset.

.. _taggers:
	
**Training Taggers**

Tagger operates on saved searches and uses machine learning. We can create a new Tagger model by clicking on the '+CREATE' button in the bottom-left. Then we must choose the name for the new Tagger (*Description*) and the fields the model learns from. If we choose two, the fields are just concatenated together before the learning process. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to it's lemma *eat* and are dealt as one word).

If we leave *Query* empty, it will take all data in the active project as a input. We can also use :ref:`saved searches <savedsearches>` as our desired input. This input will be our positive examples - later on we want to tag data similar to this one.
	
By setting these three, we can now train a classifier. However, we can also fine-tune the classifier by changing additional parameters such as
Feature Extraction (Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - read more about them `here <https://scikit-learn.org/stable/modules/feature_extraction.html>`_) and Classifier Model (`Logistic Regression <https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression>`_, `LinearSVC <https://scikit-learn.org/stable/modules/generated/sklearn.svm.LinearSVC.html>`_). We might get an error with LinearSVC in case we don't have enough data in the search.
We can set negative multiplier to change ratio of negative examples and choose maximum sample size per class.

Then we can hit create and see the training process and result of the tagger.

Whenever we create a new Tagger model, we can track it's progress from the table under *Task*. If we click on the job, we can see all the training info, how long did it took, and check how successful it was. Let's not forget that:
	1. Recall is the ratio of correctly labeled positives among all true positives.
	2. Precision is the ratio of correctly labeled positives among all instances that got a positive label.
	3. F1 score is the harmonic mean of these two and should be more informative expecially with unbalanced data.

If we click on the three dots under *Edit*, we can see a list of features to use.

*List features* lists the word-features and their coefficients that the model used. Works with models that used Count Vectorizer or Tfldf Vectorizer since their output is displayable.

*Retrain tagger* retrains the whole tagger model with all the chosen parameters. It's useful in case our dataset changes or we have added some stop words.

*Stop words* is for adding stop words. Stop words are words that the model do not consider while looking for clues of similarities. It is wise to add most frequent words in the list like *am*, *on*, *in*, *are*. Separate the words with space (' '). 

*Tag text* is to check how does the model work. If we click on that a window opens. We can paste there some text, choose to lemmatize it (necessary if our model was trained on a lemmatized text) and post it. We then recieve the result (True if this text gets the tag and false otherwise) and the probability. Probability shows how confident is our model in it's prediction. 

*Tag doc* is similar to *Tag text*, except the input is in the json format. 

*Tag random doc* takes a random instance from our dataset, displays it and returns the result and the probability of this result being correct. 

*Delete* is for deleting the model.

In the table view we can also select several models and delete them all at once by clicking on the dustbin button next to the *+CREATE* button in the bottom-left. If we have several models, we can search for the right one by their description or task status. If we have models on several pages we can change pages in the bottom-right.


.. _neurotaggers:

**Training NeuroTaggers**

NeuroTagger operates on tags and uses neural networks. This means that we must already have our own tags created in the dataset in order to train it. If we don't know what to use, we can leave all of the parameters by default. But we can also try some parameter tuning.

We definetly have to name the model (*Description*), select fields it will be trained on (*Select Fields*, multible fields will be concatenated together) and choose the tag it will be trained on (*Fact Name*). 

NeuroTagger enables us to use `Feedforward Neural Network <https://en.wikipedia.org/wiki/Feedforward_neural_network>`_ (*fnn*), `Convolutional Neural Network <https://en.wikipedia.org/wiki/Convolutional_neural_network>`_ (*CNN*), `Neural Network with Gated Recurrent Unit <https://en.wikipedia.org/wiki/Gated_recurrent_unit>`_ (*gru*), `Neural Network with Long Short-Term Memory <https://en.wikipedia.org/wiki/Long_short-term_memory>`_ (*lstm*), Convolutional Neural Network with Gater Recurrent Unit (*gruCNN*) or Convolutional Neural Network with Long Short-Term Memory (*lstmCNN*).

Parameters we can play with are as follows:

*Validation split* gives the fraction of the data that will be used as the validation data (test set).

*Score threshold* chooses the relevance of the documents that are taken into count. If the score goes below the threshold, no more docs are added.

*Sequence length* is the length of the feature vectors.

*Maximum sample size* per class. TODO

*Negative Multiplier* changes the ratio of negative examples.

*Num Epochs* how many times the network goes trough the dataset.

*Vocab size* is the vocabulary size of the neural network. TODO

*Min fact doc count* TODO

*Max fact doc count* TODO

After choosing the mandatory fields and tuning the parameters we can hit create and see the training process and result of the NeuroTagger.

Whenever we create a new NeuroTagger model, we can track it's progress from the table under *Task*. If we click on the job, we can see all the training info, how long did it took, and check how successful it was. Let's not forget that:
	1. Training accuracy is the ratio of correctly labeled instances among all instances in the training set.
	2. Training loss is the ratio of wrongly labeled instances among all instances in the training set.
	3. Validation accuracy is the ratio of correctly labeled instances among all instances in the test set.
	4. Validation loss is the ratio of wrongly labeled instances among all instances in the test set.

If we click on the three dots under *Edit*, we can see a list of features to use.

*Tag text* is to check how does the model work. If we click on that a window opens. We can paste there some text, choose to lemmatize it (necessary if our model was trained on a lemmatized text) and post it. We then recieve the result (True if this text gets the tag and false otherwise) and the probability. Probability shows how confident is our model in it's prediction. 

*Tag doc* is similar to *Tag text*, except the input is in the json format. 

*Tag random doc* takes a random instance from our dataset, displays it and returns the result and the probability of this result being correct. 

*Delete* is for deleting the model.

In the table view we can also select several models and delete them all at once by clicking on the dustbin button next to the *+CREATE* button in the bottom-left. If we have several models, we can search for the right one by their description or task status. If we have models on several pages we can change pages in the bottom-right.


.. _torchtaggers:

**Training TorchTaggers**	
	
TODO: Will be similar to NeuroTagger, will replace that. Not working atm.
	

.. _taggergroups:

**Training Tagger Groups**

Tagger Group is for training multible classes at once and it also uses tags in the dataset given.

.. note::

    **How do Tagger and Tagger Groups differ?**
	One model predicts whether a text is positive (True) or negative (False). That is, whether this text get's the label or not. Tagger trains only one model and predicts whether a text is similar to the query/dataset it was trained on or not.
	Tagger Group trains several models at once. That means, it can predict several labels at once. Tagger Group trains on facts. We can have several values under a certain fact and for each value (if it has high enough frequency (*Minimum sample size*) a model is trained.

We can create a new Tagger Group model by clicking on the '+CREATE' button in the bottom-left. Then we must choose the name for the new Tagger Group (*Description*), the facts the model starts to learn on and the minimum sample size.

Our input will be the data under the project that is active (we can check it on the blue panel up-right). We have to select the fields the model learns from. If we choose two, the fields are just concatenated together before the learning process. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to it's lemma *eat* and are dealt as one word).

There's also an option to include our :ref:`trained embeddings <embeddings>` into the training. 

Then we need to fine-tune the Tagger Group's classifiers by changing additional parameters such as
Vectorizer (possible feature extractors are: Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - read more about them `here <https://scikit-learn.org/stable/modules/feature_extraction.html>`_) and Classifier Model (`Logistic Regression <https://scikit-learn.org/stable/modules/linear_model.html#logistic-regression>`_, `LinearSVC <https://scikit-learn.org/stable/modules/generated/sklearn.svm.LinearSVC.html>`_). We might get an error with LinearSVC in case we don't have enough data in the search.
We can set negative multiplier to change ratio of negative examples in the training set. 

Then we can hit create and see the training process and result of the tagger.

Whenever we create new Tagger Group models, we can track it's progress from the table under *Task*. If we click on the job, we can see all the training info, how long did it took, and check how successful it was. Let's not forget that:
	1. Recall is the ratio of correctly labeled positives among all true positives. Avg.recall is the average of all the models' recalls.
	2. Precision is the ratio of correctly labeled positives among all instances that got a positive label. Avg.precision is the average of all the models' precisions.
	3. F1 score is the harmonic mean of these two and should be more informative expecially with unbalanced data. Avg.F1_score is the average of all the models' F1 scores.

If we click on the three dots under *Edit*, we can see a list of features to use.

*Models retrain* retrains all of the Tagger Group models with all the chosen parameters. It's useful in case our dataset changes or we have added some stop words.

*Models list* displays us the models the Tagger Group trained. We can inspect which kind of labels were trained.

*Tag text* is to check how does the model work. If we click on that, a window opens. We can paste there some text, choose to lemmatize it (necessary if our model was trained on a lemmatized text) and choose to use NER and post it. We then recieve the result (all the labels which model predicted True for this text) and the probability of this label being true. Probability shows how confident is this model in it's prediction. *Number of similar documents* is the number of most similar documents to the document in question. Tags given to these documents are tested on the document to be tagged.

*Tag doc* is similar to *Tag text*, except the input is in the json format. *Number of similar documents* is the number of most similar documents to the document in question. Tags given to these documents are tested on the document to be tagged.

*Tag random doc* takes a random instance from our dataset, displays it and returns the positive results of our models and the probability of these results being correct. 

*Delete* is for deleting the model.

In the table view we can also select several Tagger Groups and delete them all at once by clicking on the dustbin button next to the *+CREATE* button in the bottom-left. If we have several Tagger Groups, we can search for the right one by their description or task status. If we have models on several pages we can change pages in the bottom-right.

.. _tools:

.. _reindexer:

Reindexer
---------

Reindexer is a useful tool for reindexing Elasticsearch indices. Index is basically our dataset. With reindexer we can remove unwanted fields, change the type of the fields (if we have a field with text value type but actually contains dates, we can change the type to date and use it for our aggregation). 

We can create a new index by clicking on the '+CREATE' button in the bottom-left.

*Description* is the description of new reindexing job.

*New index name* is the name for our new index.

*Indices* are all the indices that we want in our new index.

*Field types* are for changing the type and/or the name of our field(s).

We can use *Query* for adding only certain search results to our new index.

*Random subset type* helps us to create an index which contains only certain amount of samples (rows). We can use this in case we want to play with a smaller subset before we apply our tools on a bigger one.











