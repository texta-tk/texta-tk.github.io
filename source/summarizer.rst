`EN <https://docs.texta.ee/summarizer.html>`_
`ET <https://docs.texta.ee/et/summarizer.html>`_

###########################
Summarizer
###########################

Apply summarizer to an index
****************************

.. _appy_summarizer:

GUI
=====

Navigate to **Tools** -> **Summarizer** and click on the **CREATE** button on top-left.
Choose the name for your task (*Description*). Select appropriate indices and then fields that contain the textual data you want to summarize. 
Select summarization algorithm(s) you wish to use.
Finally, specify the expected size of the summaries either as a ratio to the original length of the text or as the number of sentences.

.. _create_summarizer:
.. figure:: images/summarizer/create_summarizer.png
  :align: center

.. note::
    Ratio must be a decimal number between 0 and 1 and the number of sentences must be specified with a positive integer.
    The maximum number of sentences you can have is 100. It is recommended to use ratio if the index contains many documents with different lengths
    and you don't know what would be optimal number of sentences. On the other hand, specify the length in the number of sentences if you need 
    the ouput strictly to be a fixed number of sentences.  

If the task is successful then a new field is added to indices which contains the summaries.

.. _view_summarizer_results:
.. figure:: images/summarizer/view_results.png
  :align: center

API
=====

Endpoint: **/projects/{project_pk}/summarizer_index/**

.. code-block:: bash

	curl -X POST "http://localhost:8000/api/v1/projects/1/summarizer_index/" \
			-H "accept: application/json" \
			-H "Content-Type: application/json" \
			-H "Authorization: Token 7932cb0cace182f7bca0cd7a04665ee4c1d07afa" \
			-d '{
					"description": "summarize",
					"indices": [{"name": "texta_test_index"}],
                    "fields: ["body"],
                    "ratio": 0.2,
                    "algorithm": ["lexrank"]
				}'

Apply summarizer to a document
******************************

.. _appy_summarizer_to_doc:

GUI
=====

Navigate to **Tools** -> **Summarizer** and click on the **Apply to text* button on top-left.
Insert text that you want to summarize. **Note that sentences must be separated with newlines**.
Select summarization algorithm(s) you wish to use.
Finally, specify the expected size of the summaries and click **Apply**.

You should see summarized text.

.. _apply_summarizer_to_text:
.. figure:: images/summarizer/apply_to_text.png
  :align: center

API
=====

Endpoint: **/summarizer/summarize**

.. code-block:: bash

	curl -X POST "http://localhost:8000/api/v1/summarizer/summarize" \
			-H "accept: application/json" \
			-H "Content-Type: application/json" \
			-H "Authorization: Token 7932cb0cace182f7bca0cd7a04665ee4c1d07afa" \
			-d '{
					"text": "This is some text.\nThis text contains of multiple sentences.\nSentences are separated with newlines.",
                    "ratio": 1,
                    "algorithm": ["textrank"]
				}'

View
*******

GUI
====

Navigate to **Tools** -> **Summarizer**  to view existing summarizer tasks. 
If any of your tasks is still running, the view will show you the progress of the task.
Besides than that, the view shows you general information about the task if you click on it.

API
=====

Endpoint: **/projects/{project_pk}/index_splitter/**

.. code-block:: bash

	curl -X GET "http://127.0.0.1:8000/api/v1/projects/1/summarizer_index/" \
			-H "accept: application/json" \
			-H "Content-Type: application/json" \
			-H "Authorization: Token 7932cb0cace182f7bca0cd7a04665ee4c1d07afa"


Delete
*******

GUI
=====

Navigate to **Tools** -> **Summarizer** and select summarizer tasks that you want to delete. Then click on the **Trash bin** icon.


API
===

Endpoint: **/projects/{project_pk}/summarizer_index/{summarizer_id}**

Example:

.. code-block:: bash

    curl -X DELETE "http://localhost:8000/api/v1/projects/9/summarizer_index/9/" \
         -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"

