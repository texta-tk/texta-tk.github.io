`EN <https://docs.texta.ee/language_detector.html>`_
`ET <https://docs.texta.ee/et/language_detector.html>`_

.. _lang_det:

######################
Language Detector
######################

:ref:`Language Detector <lang_det_concept>` is a tool for detecting languages of the chosen :ref:`indices <index_concept>` documents. It uses `langdetect python module <https://pypi.org/project/langdetect/>`_. This is useful for getting a quick overview of the languages presented in your dataset and parse out documents in a certain language for future work.


Creation
******************


.. _lang_det_creation_parameters:

Parameters
============

.. _param_description:

**description**:
	Name of the Language Detector application task. This is necessary only for differentiating between all the Language Detector tasks in the project.


.. _param_indices:

**indices**:
  List of Elasticsearch :ref:`indices <index_concept>` containing the documents to analyze. NB! Indices should be formatted as list of dicts, where key = "name" and value = <index_name>, e.g:

  .. code-block:: json

    [{"name": "my_dataset"}]


.. _param_fields:

**fields**:
  List of field names (as strings) that are containing the content to analyze.

.. _param_query:

**query**:
  The :ref:`query <query_concept>` restricting the set of documents to analyze. In the API, the query should be formatted as a JSON string. In the GUI :ref:`saved searches <savedsearches>` can be used. By default empty and all the documents in the chosen indices are then analyzed.


GUI
====================

For creating a new Language Detector task, navigate to **"Tools"** -> **"Language Detector"** and click on the button **"CREATE"** in the upper left corner of the page. A new window with the title "Apply Language Detector task" opens as a result. Fill all the required fields and then click on the button "Create" in the bottom right corner of the window (:numref:`lang_det_create`). The new Language Detector task should now appear as a new row in the list of Language Detector tasks on the same page (if not, try refreshing the page).


.. _lang_det_create:
.. figure:: images/lang_det/lang_det_GUI.png
 :align: center
 :width: 500pt

 	*Language Detector creation window*


After the task has finished (status is "completed"), you can view the results in Search. The output of tokenization is stored in the `field <field_concept>` ``<source_field>_mlp.language_detected``.


API
===================

Endpoint for /api/v1/ : **/projects/{project_pk}/lang_index/**

Endpoint for /api/v2/ : **/projects/{project_pk}/lang_index/**

Example:

.. code-block:: bash

	curl -X POST "http://localhost:8000/api/v2/projects/1/lang_index/" \
	-H "accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
	-d '{
    		"indices": [{"name": "index_name"}],
    		"description": "job_description",
   		"field": "field_name_to_detect_on"
	}'


Response:

.. code-block:: json

	{
	  "id": 6,
	  "url": "http://localhost:8000/api/v2/projects/1/lang_index/6/",
	  "author_username": "test_user",
	  "indices": [
	  {
	     "id": 3949,
	     "is_open": true,
	     "url": "http://localhost:8000/api/v2/elastic/index/3949/",
	     "name": "index_name",
	     "description": "",
	     "added_by": "test_user",
	     "test": true,
	     "source": "",
	     "client": "",
	     "domain": "",
	     "created_at": "2021-07-27T13:56:46.118000+03:00"
	  }
	  ],
	  "description": "job_description",
	  "task": {
	     "id": 163542,
	     "status": "completed",
	     "progress": 100.0,
	     "step": "",
	     "errors": "[]",
	     "time_started": "2021-07-27T16:58:46.886043+03:00",
	     "last_update": null,
	     "time_completed": "2021-07-27T16:59:09.632845+03:00",
	     "total": 0,
	     "num_processed": 0
	  },
	  "query": "{\"query\": {\"match_all\": {}}}",
	  "field": "field_name_to_detect_on"
	}

