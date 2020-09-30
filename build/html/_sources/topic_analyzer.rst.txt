##############
Topic Analyzer
##############


.. _topic_analyzer:

Topic Analyzer is a tool that helps us to find groups of similar documents from the data and transform these groups into labels.

Grouping the data
******************
To create a new grouping (or clustering, as we name it) navigate to Models -> Clustering and click "Create". Similarly to Tagger Group object, you have to give it a name (*Description*) and select indices and fields based on which the grouping will be done. Additionally one can restrict the set of documents to be used in clustering by specifying the filter with a *Query* parameter. 

If desired, one can do some fine-tuning as well by choosing clustering algorithm and vectorizer and specifying the number of clusters (*Num clusters*) and the number of document vector dimensions (*Num dims*). 

.. note::

	**How to choose the number of clusters?**
	
	General advice would be to better have too many clusters than too few. Think about how many documents you are planning to cluster and choose the number so that the average cluster is small enough to inspect it manually with ease. For example, if you are going to cluster 1000 documents to 50 clusters then average cluster would contain 20 documents. 

Instead of using document-term matrix for clustering, we can also use compressed approximation of this matrix (with parameter *Use LSI*) which is constructed before the clustering process begins. However, LSI also requires the number of topics (dimensions in low-rank matrix) to be specified (*Num topics*).

In some cases we may already have some knowledge about the data that we are about to cluster. For example, we may be aware of some domain-specific stopwords which we would like to ignore. As name already suggests, these can be listed in the field *Stopwords*. 

.. _figure-17:

.. figure:: images/create_clustering.png

    Figure 17. *Creating a Clustering*


Evaluating clusters
********************

To see the clusters, click *View clusters* under Actions. This view gives us an overwiew about obtained clusters. For each cluster the document count and average cosine similarity between its documents is shown. Additionally, a list of significant words for each cluster is given - it is a list of words that, when compared to other documents, appear notably often in documents which belong to that cluster.

.. _figure-18:

.. figure:: images/clusters_view.png
    :width: 100 %

    Figure 18. *Clusters view*

.. note::

	**Interpreting document count**
	
	Cluster with significantly larger document count often indicates that the clustering algorithm has failed to separate these documents by the topic. It doesn't necessarily mean that the clustering process in general has been unsuccessful as often it is impossible to cluster all documents perfectly. However, you still might want to take a closer look to such clusters as there may be other reasons for such results as well. For example, the documents in that cluster may contain similar noise or stopwords that makes them artifically similar to each other. Sometimes increasing the number of clusters might help as well.

	**Interpreting average similarity**
	
	Average similarity is an average cosine similarity between all the documents in the cluster. It ranges between 0 and 1 and higher score indicates that the documents in that cluster are more similar to each other. However, the score has some disadvantages. For example, when a cluster contains 9 documents that are very similar to each other and 10th document is very different from all others, then the score might appear low althought fixing that cluster would be very easy.

To see content of a cluster, simply click on a cluster that is in your interest, this opens you a Cluster Details view.

Operations with cluster
************************
Cluster Details view allows us to inspect actual documents belonging to a cluster.

If we are satisfied with what it contains, we can tag the content by clicking "Tag" button. This operation adds a texta_fact to each of the document in the cluster, with specified name and a string value. **From now on, these documents will be ignored in further clustering processes**.

If not satisfied, we probably want to do some corrections in the cluster content manually, that is, remove some documents from it. This can be done by selecting the documents that we want to remove and clicking on trash bin icon. Note that these documents will not be ignored in further clustering process.

We could also be interested in whether there is more documents in the index that are similar to the ones in given cluster. If indeed there is, we might want to add those documents to the cluster as well, so we could tag them all together. 

To query similar documents, click on a "More like this" button. In the opened view, select document which you would like to add to the cluster and click on a "+" button.

.. _figure-19:

.. figure:: images/cluster_details_view.png
    :width: 100 %

    Figure 19. *Cluster details view*


There is an API for topic analyzer, but the magic of the analyzer dissappears when using API.

