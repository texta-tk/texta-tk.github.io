
###########################
Index Splitter
###########################

Create
*******

.. _create_splitting_task:

GUI
=====

Navigate to **Tools** -> **Index Splitter** and click on the **CREATE** button on top-left.
Choose the name for your task (*Description*) and select indices which are used to create train and test sets.
Optionally you can select fields and query to filter the data (this part is very similar to :ref:`reindexer <reindexer>`).

.. note::
    Scroll size is used to limit the size ElasticSearch's batches to avoid timeout errors. 

Define the names of the train and test set.
*Test size* represents a percentage with "random" or "original" distribution and a quantity with "equal" or "custom" distribution.

*Fact name* is the fact based on which the split will be made in case of "original" or "equal" distribution.

*Str val* is the value of fact base on which the split will be made. Use this if you have multiple values associated with the 
fact and you want to specify which value should have the defined distribution in both sets.

*Distribution* specifies the way you want your data to be split. In case you want to 
use a custom distribution, you can define it in the last field (*custom_distribution*).

*Custom_distribution* is a dictionary containing custom label distribution with keys as labels and values as quantities.

.. note::
    *Distributions*

    **random** - splits the data completely randomly. Test index will contain the fraction of documents defined by *test_size*.

    **original** - splits the data by preserving the original distribution of given fact's (*fact_name*) values. 	
    Test index will contain the fraction of documents defined by *test_size*. Note that the distribution
    is not guaranteed to be preserved if you have multiple facts with the same name associated with a document.

    **equal** - splits the data so that each value of the fact (*fact_name*) is represented a fixed amount (*test_size*) of times in the test index.
   
    **custom** - splits the data so that the fact's values in the test index will follow your custom distribution (*custom_distribution*).

.. _index_splitting_create:
.. figure:: images/index_splitter/create.png
  :align: center

If the task is successful, the newly created indices are added to the project.

.. _index_splitting_indices:
.. figure:: images/index_splitter/new_indices.png
  :align: center

API
=====

Endpoint: **/projects/{project_pk}/index_splitter/**

.. code-block:: bash

	curl -X POST "http://localhost:8000/api/v1/projects/1/index_splitter/" \
			-H "accept: application/json" \
			-H "Content-Type: application/json" \
			-H "Authorization: Token 7932cb0cace182f7bca0cd7a04665ee4c1d07afa" \
			-d '{
					"description": "split documents",
					"indices": [{"name": "texta_test_index"}],
					"text_index": "test_documents",
					"train_index": "train_documents",
					"test_size": 20,
					"fact_name": "TOPIC",
					"distribution": "original"
				}'

View
*******

GUI
====

Navigate to **Tools** -> **Index Splitter**  to view existing index splitting tasks. 
If any of your tasks is still running, the view will show you the progress of the task.
Besides than that, the view shows you general information about the tasks.

API
=====

Endpoint: **/projects/{project_pk}/index_splitter/**

.. code-block:: bash

	curl -X GET "http://127.0.0.1:8000/api/v1/projects/1/index_splitter/" \
			-H "accept: application/json" \
			-H "Content-Type: application/json" \
			-H "Authorization: Token 7932cb0cace182f7bca0cd7a04665ee4c1d07afa"

Delete
*******

GUI
====

Navigate to **Tools** -> **Index Splitter** and select the task you want to delete and click on trash icon to delete it.

API
=====

Endpoint: **/projects/{project_pk}/index_splitter/{index_splitter_id}/**

.. code-block:: bash

	curl -X DELETE "http://127.0.0.1:8000/api/v1/projects/1/index_splitter/15/" \
		-H "accept: application/json" \
		-H "Content-Type: application/json" \
		-H "Authorization: Token 7932cb0cace182f7bca0cd7a04665ee4c1d07afa"


