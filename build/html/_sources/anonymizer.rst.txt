`EN <https://docs.texta.ee/v2/anonymizer.html>`_
`ET <https://docs.texta.ee/v2/et/anonymizer.html>`_

.. _anonymizer:

#############
Anonymizer
#############

Anonymizer is a tool for anonymizing names in a text based on a predefined list of names. Each name detected from the text will be substituted with randomly generated pair of initials.


.. note::

	The current version of Anonymizer `fully` supports only texts in **Estonian**.

.. note::

	If parameters `replace_single_last_names` and/or `replace_single_first_names` are activated, all given last and first names found from the text are anonymized - even if they are actually part of another name not given in the list of anonymizable names.

	**Example**:

	.. code-block:: bash

		names = ["Trump, Donald"]
		text = "Donald Trump and Ivanka Trump"
		anonymized_text = "K.R and Ivanka K.R"

**API reference**: `<http://localhost:8000/api/v1/redoc/#tag/projects-greater-anonymizers>`_

Creation
***************

.. _anon_creation_parameters:

Parameters
============


**description**:
	Name of the Anonymizer model.

**misspelling_threshold**:
  Minimum required `Jaro-Winkler similarity <https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance>`_ between names present in the text and names to anonymize, i.e. how different any two names can be for the model to presume they are meant to represent the same name.

  .. note::

		Used only if parameter `replace_misspelled_names` is activated.

**replace_misspelled_names**:
  Anonyymize incorrectly spelled names.

	.. note::

		Might sometimes lead to falsely anonymizing irrelevant entities as the model doesn't know how to distinguish incorrect spelling of a name from a correctly spelled similar other name. E.g. ("Eastwood", "Eestwood") vs. ("Ahto", "Ahti").

**replace_single_last_names**:
  Anonymize last names if they occur without first name.

**replace_single_first_names**:
  Anonymize first names if they occur without last name.

**auto_adjust_threshold**:
  Automatically adjust misspelling threshold if any two names in the given list to anonymize are more similar than configured `misspelling_threshold` to avoid collision errors.


GUI
============

For creating a new Anonymizer, navigate to `"Tools" -> "Anonymizer"` as seen in :numref:`anonymizer_nav`.

.. _anonymizer_nav:
.. figure:: images/anonymizer/anonymizer_nav.png
	:width: 500pt
	:align: center

	*Anonymizer navigation*

If the navigation is successful, you should see a panel similar to :numref:`anonymizer_create_button` with `"Create"` button in the top left corner of the page.

.. _anonymizer_create_button:
.. figure:: images/anonymizer/anonymizer_create_button.png
	:width: 500pt
	:align: center

	*Anonymizer creation button*


Clicking on the `"Create"` button opens a modal window with text `"New Anonymizer"` as depicted in :numref:`anonymizer_new_anonymizer`.

.. _anonymizer_new_anonymizer:
.. figure:: images/anonymizer/new_anonymizer_mw.png
	:width: 300pt
	:align: center

	*Empty Anonymizer creation view*


Name your Anonymizer model by filling the field `Description` and modify defaulted parameters. Click on the `"Create"` button in the bottom right corner of the window (:numref:`anonymizer_create_view`).

.. _anonymizer_create_view:
.. figure:: images/anonymizer/default_anonymizer.png
	:width: 300pt
	:align: center

	*Filled Anonymizer creation view*


The created Anonymizer can now be seen as the first (or only, if no previous Anonymizers exist under the :ref:`project <project_concept>`) row in the table of Anonymizers (:numref:`anonymizer_list`).

.. _anonymizer_list:
.. figure:: images/anonymizer/anonymizer_list.png
	:width: 500pt
	:align: center

	*List of Anonymizers.*

API
============

Reference: `<http://localhost:8000/api/v1/redoc/#operation/projects_anonymizers_create>`_

Endpoint: **/projects/{project_pk}/anonymizers/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/anonymizers/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My anonymizer",
                "replace_misspelled_names": true,
                "replace_single_last_names": true,
                "replace_single_first_names": true,
                "misspelling_threshold": 0.9,
                "auto_adjust_threshold": true
            }'


Usage
**********

Anonymize Text
=================

Parameters
--------------

**texts**
	Texts to anonymize.

**names**
	List of names to anonymize.

	.. note::

		Each name should be formatted followingly: "<last_name>, <first_name>"

GUI
--------

For using an existing Anonymizer to anonymize a text, navigate to `"Tools" -> "Anonymizer"` as seen in :numref:`anonymizer_nav`. After successful navigation, you should see a list of existing Anonymizers. Select the Anonymizer you wish to use for the anonymization and navigate to options panel as seen in :numref:`anonymizer_actions_0`.

.. _anonymizer_actions_0:
.. figure:: images/anonymizer/anonymizer_actions_0.png
	:width: 500pt
	:align: center

	*Anonymizer options panel location.*

After clicking on the three vertical dots denoting `"Options"`, a small selection menu opens as seen in :numref:`anonymizer_actions_1`. Select option `"Anonymize text"`.

.. _anonymizer_actions_1:
.. figure:: images/anonymizer/anonymizer_actions_1.png
	:align: center

	*Anonymizer -> Anonymize Text*

Clicking on the option opens a new modal window with the title `"Anonymize text"` and two input fields: `"text"` and `"names"` (:numref:`anonymize_text_empty`).

.. _anonymize_text_empty:
.. figure:: images/anonymizer/anonymize_text_empty.png
	:width: 500pt
	:align: center

	*Empty "Anonymize text" window.*

Insert the text you wish to anonymize in the field `"text"` and insert a list of newline-separated anonymizable names in format `"last_name, first_name"` in the field below (:numref:`anonymize_text_pre`).

.. _anonymize_text_pre:
.. figure:: images/anonymizer/anon_text_pre.png
	:width: 500pt
	:align: center

	*Filled "Anonymize text" window.*

Click on the `"Submit"` button in the bottom right corner. The resulting text with anonymized names should appear instantly below the same panel (:numref:`anonymize_text_post`).

.. _anonymize_text_post:
.. figure:: images/anonymizer/anon_text_res.png
	:width: 500pt
	:align: center

	*"Anonymize Text" result.*

API
--------------

Reference: `<http://localhost:8000/api/v1/redoc/#operation/projects_anonymizers_anonymize_text>`_

Endpoint **/projects/{project_pk}/anonymizers/{id}/anonymize_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/anonymizers/1/anonymize_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "Bonnie Parker and Clyde Barrow are believed to have murdered at least nine police officers.",
                "names": ["Parker, Bonnie Elizabeth", "Barrow, Clyde Chestnut"]
            }'

Response:

.. code-block:: json

    "N.Q and X.R are believed to have murdered at least nine police officers."


Anonymize Texts
=======================

Function `"Anonymize Text"` allows anonymizing multiple texts at once. The order of the texts is preserved during anonymization, i.e. if source text `t` is located at position `i` in the input array, then the anonymized version of the same text is located at position `i` in the result array.

Parameters
--------------

**texts**
	List of texts to anonymize.

**names**
	List of names to anonymize.

	.. note::

		Each name should be formatted followingly: "<last_name>, <first_name>"

**consistent_replacement**
	If activated, same names across different texts are anonymized with the same replacement symbols.

API
-------------------

Reference: `<http://localhost:8000/api/v1/redoc/#operation/projects_anonymizers_anonymize_texts>`_

Endpoint **/projects/{project_pk}/anonymizers/{id}/anonymize_texts/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/anonymizers/1/anonymize_texts/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
               "texts": [
                    "Bonnie Parker and Clyde Barrow are believed to have murdered at least nine police officers.",
                    "Bonnie and Clyde were killed in May 1934."
                ],
               "names": ["Parker, Bonnie Elizabeth", "Barrow, Clyde Chestnut"],
               "consistent_replacement": true
            }'

Response:

.. code-block:: json

        [
            "F.Q and T.T are believed to have murdered at least nine police officers.",
            "F.Q and T.T were killed in May 1934."
        ]

Edit
=================

GUI
---------


For editing an existing Anonymizer, select the Anonymizer you wish to edit and navigate to options by clicking on the three vertical dots at the end of the Anonymizer row.

.. _anonymizer_actions_2:
.. figure:: images/anonymizer/anonymizer_actions_2.png

	*Anonymizer -> Edit*

Select option `"Edit"` (:numref:`anonymizer_actions_2`). Make your modifications and click  on the `Submit` button in the bottom right corner of the modal window for finishing the process.

API
-----------

Reference:  `<http://localhost:8000/api/v1/redoc/#operation/projects_anonymizers_update>`_

Endpoint **/projects/{project_pk}/anonymizers/{id}/**

Example:

.. code-block:: bash

			curl -X PATCH "http://localhost:8000/api/v1/projects/11/anonymizers/1/" \
			-H "accept: application/json" \
			-H "Content-Type: application/json" \
			-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
			-d '{
				"replace_single_last_names": false
			 }'


Response:

.. code-block:: json

	{
	    "id": 25,
	    "url": "http://localhost:8000/api/v1/projects/11/anonymizers/1/",
	    "description": "default",
	    "replace_misspelled_names": true,
	    "replace_single_last_names": false,
	    "replace_single_first_names": true,
	    "misspelling_threshold": 0.9,
	    "auto_adjust_threshold": true
	}

Delete
==================

GUI
----------

For deleting an existing Anonymizer, select the Anonymizer(s) you wish to delete by clicking on the selection box(es) in front of the Anonymizer(s). If the Anonymizer(s) you wish to delete is (are) selected, click on the red recycle bin icon above the Anonymizers' table (:numref:`anonymizer_delete`).

.. _anonymizer_delete:
.. figure:: images/anonymizer/anon_delete.png
	:width: 300pt
	:align: center

	*Delete Anonymizer*

The application should ask your confirmation before deleting the Anonymizer(s) (:numref:`anonymizer_delete_confirm`). Click on the `Delete` button at the bottom right corner of the confirmation window to finalize the process.

.. _anonymizer_delete_confirm:
.. figure:: images/anonymizer/anon_delete_confirm.png
	:width: 300pt
	:align: center

	*Delete Anonymizer confirmation*


API
----------

References:

`<http://localhost:8000/api/v1/redoc/#operation/projects_anonymizers_delete>`_

`<http://localhost:8000/api/v1/redoc/#operation/projects_anonymizers_bulk_delete>`_

Endpoint **/projects/{project_pk}/anonymizers/{id}/**

Example:

.. code-block:: bash

			curl -X DELETE "http://localhost:8000/api/v1/projects/11/anonymizers/1/" \
			-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"
