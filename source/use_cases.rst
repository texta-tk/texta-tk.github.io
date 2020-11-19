`EN <https://www.youtube.com/watch?v=dc2Z7CL4Cv0>`_
`ET <https://www.youtube.com/watch?v=dQw4w9WgXcQ>`_

################
Use Cases
################

This chapter describes how to use Texta Toolkit's different tools to answer some research questions.

How to search for a topic if you don't know enough topic words?
***************************************************************
Research question: *What is the frequency of sport-related documents through time?"*

Pre-requirements:

* A project with the sputnik newspaper articles dataset is :ref:`created <project>`.
* This project is active (chosen on the upper panel in the right).
* :ref:`Searcher <searcher>` is open.

Train an embedding
====================

Go to Models > Embeddings. Click on "CREATE" in the top-left. Create an Embedding (:numref:`embedding_pic`). Read more about the creating parameters :ref:`here <create_embedding>`.

.. _embedding_pic:
.. figure:: images/use_cases/embedding.png
	
	*Creating an embedding for sputnik*
	
This step might take a while. After the embedding model is trained, the Lexicon Miner can be used.

Use Lexicon Miner
==================

Use the :ref:`Lexicon Miner <lexiconminer>` for mining other words than just "sport".

.. _miner:
.. figure:: images/use_cases/miner.png
	
	*Providing some seed words for before hitting "New Suggestions"*
	
Provide some seedwords (example in :numref:`miner`), hit "New Suggestions", click on suitable terms and repeat as long as the suggestions contain suitable terms. Then hit "Save".

Search
=======

Go to the Search page. As this example embedding was trained on lemmas field, choose the same field in the Advanced Search. Click on "Add lexicon" button and choose the saved lexicon.

.. _add_lexicon:
.. figure:: images/use_cases/add_lexicon.png

	*Add lexicon for the search constraint*
	
Choose the operator "or". Match stays default ("Phrase prefix") and Slop also ("0"). Click on Search. 

You now have more results than just searching the term "sport"!

Bonus: aggregate over time
===========================

Research question: *When are sport-related articles published?*

In order to aggregate the documents over time, open the Aggregations panel and choose the date field (in Texta date format). Configure other options as shown in :numref:`aggregate_sport` or leave them as default. Click on "Aggregate".

.. _aggregate_sport:
.. figure:: images/use_cases/aggregate_sport.png
	
	*Active sport-topic search results' aggregation over date field*
	
The aggregation outputs a line chart with the results. The X-axis is the raw frequency, Y-axis is the date. 

.. _linechart_sport:
.. figure:: images/use_cases/linechart_sport.png
	
	*Line chart of sport-related articles from 1th of January 2011 to 1th of January 2015*

You can see that most sport-related articles are published in August 2012 and February 2014. These, surprise-surprise, overlap with the times of Summer Olympics (27th of July to 12th of August 2012) and Winter Olympics (7th of February to 23rd of February 2014).

When is this term most frequently used?
****************************************

Research question: *How frequent are the terms "communism" and "communists" in Sputnik through time?*

Pre-requirements:

* A project with the sputnik newspaper articles dataset is :ref:`created <project>`.
* This project is active (chosen on the upper panel in the right).
* :ref:`Searcher <searcher>` is open.

Search term(s)
==============

Click on "Advanced search" and choose the field with the content in it ("article_text"). :numref:`search_communism` describes the search constraint for finding documents with words that start with "communis" (e.g "communism", "communist", "communists") - operator is "and" or "or", match is "Phrase prefix" and there is no slop. Click on "Search".

.. _search_communism:
.. figure:: images/use_cases/search_communism.png

	*Search constraint for finding communism-related articles*

Now the table displays all the documents that the searcher with this constraint filtered out. This search result is now *active*. If you want, you can save it for later, but as the Aggregation works on active searches, leave it as it is.

Aggregate over time
====================

To aggregate the documents over time, open the Aggregations panel and choose the date field (in Texta date format). Other options can be left as they are. Click on "Aggregate".

.. _aggregate_communism:
.. figure:: images/use_cases/aggregate_communism.png
	
	*Active search results' aggregation over date field*
	
The aggregation outputs a line chart with the results. The X-axis is the raw frequency, Y-axis is the date (you can change the unit on the Aggregation panel under Interval).   

See more aggregating examples under :ref:`Search <aggregations>`.


Train a classifier
*******************
