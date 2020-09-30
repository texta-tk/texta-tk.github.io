##########
Reindexer
##########

Reindexer is a useful tool for reindexing Elasticsearch :ref:`indices <index_concept>`. We can think of index as our dataset. With reindexer we can remove unwanted fields, change the type of the fields (if we have a field with text value type but actually contains dates, we can change the type to date and use it for our aggregation). 

GUI
****

We can create a new index by clicking on the **+CREATE** button in the bottom-left.

*Description* is the description of new reindexing job.

*New index name* is the name for our new index.

*Indices* are all the indices that we want in our new index.

*Field types* are for changing the type and/or the name of our field(s).

We can use *Query* for adding only certain search results to our new index.

*Random subset type* helps us to create an index which contains only certain amount of samples (rows). We can use this in case we want to play with a smaller subset before we apply our tools on a bigger one.

.. _reindexer:
.. figure:: images/reindexer.png

    *Creating a new index*
    
    
API
****
TODO
