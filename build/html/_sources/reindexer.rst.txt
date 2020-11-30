.. _reindexer:
`EN <https://docs.texta.ee/v2/reindexer.html>`_
`ET <https://docs.texta.ee/v2/et/reindexer.html>`_

############
Reindexer
############

Reindexer is a tool for making copies or subsets of Elasticsearch :ref:`indices <index_concept>`. Reindexer can be used for various data management tasks:

- Making a copy of an index;
- Merging multiple indices into one;
- Making a random subset of an index;
- Making a subset based on predefined :ref:`query <query_concept>`;
- Renaming fields;
- Updating Elasticsearch :ref:`field <field_concept>` types.

Creation
***********

.. _reindexer_creation_parameters:

Parameters
------------------

**description**:
  Name of the Reindexing task.

**indices**:
  List of Elasticsearch :ref:`indices <index_concept>` (datasets) to reindex.

**fields**:
  List of fields to reindex, i.e. transfer to the new index. By default, all the fields in the source index are selected.

**query**:
  Specified Elasticsearch Search :ref:`query <query_concept>`. If left empty (and `random_size` is not defined), all documents from the source index are transferred to the new one.

**new_index**:
  Name of the target index.

**random_size**:
  Random subset size. If defined, new index is constructed of given number of random documents. If left empty, all the documents in the source index (or in accordance with restricted search :ref:`query <query_concept>`) are reindexed.

**field_type**:
  List of new Elasticsearch :ref:`field <field>` types in the following format:

  .. code-block:: json

    [{"field_name": "new_field_type"}]


GUI
-----------------


For creating a new Reindexing task, navigate to `"Tools" -> "Reindexer"` as seen in :numref:`reindexer_navigation`.

.. _reindexer_navigation:
.. figure:: images/reindexer/reindexer_nav.png
	:width: 500pt
	:align: center

	*Reindexer navigation*

If the navigation is successful, you should see a panel similar to :numref:`reindexer_create_button` with `"Create"` button in the top left corner of the page.

.. _reindexer_create_button:
.. figure:: images/reindexer/reindexer_create_button.png
	:width: 500pt
	:align: center

	*Reindexer creation button*

Clicking on the `"Create"` button opens a new modal window with title `"New Reindexer"` as depicted in :numref:`reindexer_create_new`.

.. _reindexer_create_new:
.. figure:: images/reindexer/reindexer_create_new.png
	:width: 500pt
	:align: center

	*Empty Reindexer creation view*

Fill the required fields and click on the `"Create"` button in the bottom right corner of the window (:numref:`reindexer_create`).

.. _reindexer_create:
.. figure:: images/reindexer/reindexer_create.png
	:width: 500pt
	:align: center

	*Filled Reindexer creation view*

The created Reindexer can now be seen as the first (or only, if no previous Reindexers exist under the :ref:`project <project_concept>`) row in the table of Reindex tasks (:numref:`reindexer_task_list`).

.. _reindexer_task_list:
.. figure:: images/reindexer/reindexer_task_list.png
	:width: 600pt
	:align: center

	*List of Reindexer tasks.*

API
---------------------

Reference:  `<http://localhost:8000/api/v1/redoc/#operation/projects_reindexer_create>`_


Endpoint **/projects/{project_pk}/reindexer/**

Example:

.. code-block:: bash

  curl -X POST "http://localhost:8000/api/v1/projects/1/reindexer/" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
  -d '{
        "description": "reindex imdb reviews",
        "indices": ["imdb_reviews"],
        "fields": ["review_text", "doc_id"],
        "new_index": "imdb_reviews_copy"
      }'

Response:

.. code-block:: json

  {
      "id": 81,
      "url": "https://localhost:8000/api/v1/projects/1/reindexer/1/",
      "author_username": "my_username",
      "description": "rewindex imdb reviews",
      "fields": ["review_text", "doc_id"],
      "query": "{\"query\": {\"match_all\": {}}}",
      "new_index": "imdb_reviews_copy",
      "random_size": 0,
      "field_type": [],
      "task": {
          "id": 153610,
          "status": "created",
          "progress": 0.0,
          "step": "",
          "errors": "[]",
          "time_started": "2020-10-27T11:37:06.276108+02:00",
          "last_update": null,
          "time_completed": null,
          "total": 0,
          "num_processed": 0
      }
  }
