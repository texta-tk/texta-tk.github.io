########
Search
########

The Search application is responsible for both creating the searches defining subsets of documents for Toolkit's other applications and browsing-summarizing the data.

.. note::
	In order to use **Search**, project must be selected in upper panel.

Search's graphical interface consists of serveral important panels, which are depicted in :numref:`search_panel`.
We can collapse or open the panels by clicking on the arrow in the corner.

.. _search_panel:
.. figure:: images/search_panel.png

	*Search Panel*
    
        1. :ref:`Current Search <currentsearch>`
        2. :ref:`Saved Searches <savedsearches>`
        3. :ref:`Aggregations <aggregations>`

.. _currentsearch:

Current Search
***************

Data browsing and summarization depend on searches. Search consists of a set of constraints on :ref:`field <field_concept>` values. We can define our constraints on the data using the *Current Search* panel.
Without saving the constraints, we are in a “test mode”, which means that we can use the search in real time, but we cannot use the search in other tools.
After saving the search, it is available also to other tools.


.. note::
	The search will be done on the Project's dataset(s) chosen in the upper panel.
	
.. _current_search:
.. figure:: images/current_search.png

	*Current search*
	
	From left to right in the red box:
    
        a. view query constructed with Current Search in a more suitable format for :ref:`Elasticsearch <elasticsearch>`,
        b. save the constructed search,
        c. collapse Current Search panel.

Current Searh divides into Simple Search and Advanced Search (look below).

.. note::
	Current match doesn't differentiate lower and upper case (except regex constraint). This means that searching for "President" also matches "president". If the case is important in the search, use regex constraint (see below).

Simple Search
=============

Simple search searches for a word on all fields in the chosen dataset. Words separated with space (' ') are considered as a space-separated list - each word must occur in at least one field in the document.

.. _simple_search:
.. figure:: images/simple_search.png

	*Simple search*. 'word1', 'word2', 'word3' are searched from all the fields in the document. Only those which have all of them matched at least once, are returned.

Advanced Search
===============

Advanced search searches for a constraint in a certain field in the chosen dataset. Constraints can be added on different fields in one search. Constrainst can be removed via the 'X'-sign in upper right. The constraints can be divided into three: string constraint, date constraint and texta_tag constraint (look below). When the constraints are chosen the Search output can be seen via "Search"-button.

String constraint
-------------------
One line equals one search item. This constraint has several operators. Look below for their functions. 

.. list-table:: Operators
   :widths: 10 25
   :header-rows: 1

   * - Operator
     - Meaning
   * - and
     - all of the items (lines) are matched in the document 
   * - or
     - at least one of the items (lines) is matched in the document
   * - not
     - definetly none of the items are matched in the document
   * - phrase prefix
     - matches the beginning of the words (endings can differ, e.g. searching for 'bribe' gives us 'bribe', 'bribery', 'bribetaking', etc)
   * - word
     - finds exact word written (similar to simple search)
   * - phrase 
     - finds exact match for a phrase (more than one word in one line)
   * - regex
     - takes the input as `a regular expression <https://www.rexegg.com/regex-quickstart.html>`_ and searches document accordingly. Nb! This is :ref:`Elasticsearch <elasticsearch>` syntax.
   * - slop
     - defines how many words can be between the phrase words defined
     
.. _string_search:
.. figure:: images/string_search.png

	*String constraint*. This string constraint is on field named "text". It looks for documents that have either phrase "president Obama" or "president Trump" in it (or both). Since the Slop is 2, it also matches the phrase if it has 0-2 words between the words (e.g "president Barack Obama"). The "X" in the red square is for deleting this constraint.
	
The string constraint has an option to add :ref:`a saved lexicon's <lexiconminer>` terms into the search (via button "Add lexicon"). 

Date constraint
-------------------
Date constraint works only on a proper datefield. This outputs only those documents which datefield are within the chosen time range (starting day included and ending day excluded). The time range can be chosen by clicking on the little calendar in the right.

.. _date_constraint:
.. figure:: images/date_constraint.png

	*Date constraint*

Texta_tag constraint
------------------------
Texta_tag constraint helps to find certain :ref:`tag <texta_fact>` or :ref:`tags <texta_fact>` with certain values. You can find several different values at once with the little '+'-sign which adds one more value-line. Look in the table above for the operators' meanings. 

.. _tag_constraint1:
.. figure:: images/tag_constraint1.png

	*Texta_tag tag constraints*. Search for documents that have at least one ORG tag in it and definetly no PER tags. 
	
.. _tag_constraint3:
.. figure:: images/tag_constraint3.png

	*Texta_tag tag value constraint with or*. Texta_tag tag constraint enables choosing multible tags at once. For example this constraint outputs all documents that has at least one of the tags (COMPANY, EML, ADDR) in it.
	
.. _tag_constraint2:
.. figure:: images/tag_constraint2.png

	*Texta_tag tag value constraint*. Search for documents that have an ORG tag with either value "NATO" or value "European Union" in it (or both).

Search Options
==============

Look at the table below for the meanings of search options. 

.. list-table:: Search options
   :widths: 25 25
   :header-rows: 1

   * - Option
     - Meaning
   * - Highlight facts
     - highlights all the facts in the text
   * - Only highlight matching facts
     - highlights only the facts that were looked for
   * - Highlight searcher matches
     - highlights string constraints' matches
   * - Show short version
     - shows certain amount of words before and after the match

.. _search_options:
.. figure:: images/search_options.png

	*Search Options*. Only texta_tag constraints will be highlighted in the results with these selected Search Options. 
	
Examples
========

.. _search_example1:
.. figure:: images/search_example1.png

	*Regex String Constraint*. Search for documents that have either "payoff" or "bribe[a-z]{0,2}" in it. Last of which means word 'bribe' with 0-2 extra letters (e.g "bribe", "bribed", "bribery").
	
.. _search_combination:
.. figure:: images/search_combination.png

	*Combination of constraints*. Search for documents published in 2014, contain LOC tags with values "Russia" and "Ukraine" and the word "invasion".


Browsing Search results
========================

If we click on “Search” button, we will see the matching documents in a tabular form (see :numref:`search_results`). The results might be updating while modifying the constraints.

.. _search_results:
.. figure:: images/search_results.png
	:width: 100 %

	*Example Search Results*

If there are too many features (columns), we can hide or show them from the drop-down menu in the up left corner. We can select or deselect all of them together (*Select all*) or by clicking on them separately. We can also hide or get back the Searcher's panels with *Toggle drawer* button. We can browse through Searcher's results with the arrows in the upper right. We can also choose how many items per page would we want to see in the upper right.

.. _search_rt:
.. figure:: images/search_results_toggle.png

	*Select Fields for Search Results*

.. note::
	API for scrolling can be found `here <https://rest-dev.texta.ee/api/v1/projects/1/scroll/>`_.

.. _savedsearches:

Saved Searches
***************

After having comed up with a suitable search, it can be saved for later use by clicking on the **disk** icon up-right in the Current Search panel. The **eye** icon next to the disk icon shows us the actual :ref:`Elasticsearch <elasticsearch>` query built by choosing the Operators and words to search for.

After saving a search, it becomes available for using in Toolkit's applications. For example, they can be used in browsing the search later again or applying in aggregations. The saved search can be sent to other users who have the permission to the project with a copied url.
This opens the saved search under the Current Search for the other user.
Saved searches can be opened in the Current Search simply by clicking on it.

.. note::
	API support for saving searches can be found `here <https://rest-dev.texta.ee/api/v1/projects/1/searches/>`_.

.. _aggregations:

Aggregations
*************

As fun as browsing through the data is, it is not always enough. Sometimes we want to get an overview of our data, such as topics over time or word distributions. Searcher allows to do all of that and more through the “Aggregations” panel.

Aggregations have two components - data and features it aggregates over. It will aggregate over the dataset we have under the Current Search. We can also exclude current search (meaning that 'Aggregate over all data except the one we have currently active') and choose the aggregation size. By defining a feature, we can group by that feature and get category counts. For example, lets assume we are interested in seeing how are the top words distributed in our sample data defined by our “bribe” search. For that we simply click on our bribe search under Saved Searches to get it as the current search.

.. note::

    **How are the significance scores calculated?**
	The numbers returned for scores are primarily intended for ranking different suggestions sensibly rather than something easily understood by end users. The scores are derived from the doc frequencies in foreground and background sets. In brief, a term is considered significant if there is a noticeable difference in the frequency in which a term appears in the subset and in the background. The way the terms are ranked can be configured, `see "Parameters" section <https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-significanttext-aggregation.html>`_.

One cool thing we can also do, is to visualize the frequency of texts with searched words in it on a timeline. We can do that if we have a proper date field (in Texta date format) in our data. Here we can visualize when were the words 'bribe', 'bribery' and 'bribed' used most frequently in our dataset.

We can also aggregate over :ref:`texta_facts <texta_fact>` field in order to see the top entities under some tag. If we click on the black diagram button, we can scroll through the results. We see as many entities as we chose for our aggregation size.

