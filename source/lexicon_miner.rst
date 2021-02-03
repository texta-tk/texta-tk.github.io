`EN <https://docs.texta.ee/lexicon_miner.html>`_
`ET <https://docs.texta.ee/et/lexicon_miner.html>`_

.. _lexiconminer:

##############
Lexicon Miner
##############

Texta Toolkit enables the creation of topic-related lexicons which can be used to expand the Searcher's results (e.g. defining classes for classifiers). In order to build lexicons, you must have an :ref:`Embedding <embedding_concept>` model :ref:`previously trained <create_embedding>` .

Usage
******

Parameters
===========

**positives_used**:
	List of words similar to which suggestions are to be found. These are the positive input for the model's similarity search. In GUI called "positives".
	
**negatives_used**:
	List of words similar of which suggestions are NOT to be found or old suggestions that didn't make it to the positives' list. These are the negative input for the model's similarity search. In GUI called "negatives".
	
**positives_unused**:
	List of words already mined out, but not to be used in the model's similarity search. These won't occur in the output (suggestions list).
	
**negatives_unused**:
	List of words of the suggestions that weren't chosen, but are not to be used as negatives in the models' similarity search. These won't occur in the output (suggestions list).
	
**n**:
	The number of output words. In GUI it's by default 20.
	
GUI
===

For creating a lexicon, type the name of the lexicon in the "Description" slot after clicking "CREATE"-button under "Lexicons" and press enter. The new lexicon appears in the table. Click on the lexicon's row. Lexicon's mining view opens.

Choose the embedding trained in Toolkit to work with. Provide some seed words (like 'sport' if you are after finding sport-related terms) in the Positives list separated by a newline.

The process of creating (or expanding) the lexicon is iterative. Keep asking for suggestions via:

**New Suggestions** button, which transfers unchosen words into Negatives list where they are used as the opposites in the model's similarity search.

or

**Clear Suggestions** button, which transfers the unchosen words into Negatives unused list where they are not used in the model's similarity search but are filtered out from the next possible suggestions. To get new suggestions after clearing the list, use the New Suggestions button again.

Pick the ones from the Suggestions list that make sense by clicking on them. Keep asking for suggestions until you get no more meaningful responses. You can also expand the lexicon based on one or two words while storing (but not mining with) the already mined out words in the Positives unused list.

To add a suitable word to the lexicon from the Suggestions list, you simply have to click on it. Alternatively, you can type yourself some words you have come up while reading through the suggestions into the list.

Don't forget to save the lexicon when you are ready!
