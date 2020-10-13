`EN <https://docs.texta.ee/v2/anonyymizer.html>`_
`ET <https://docs.texta.ee/v2/et/anonymizer.html>`_

#############
Anonymizer
#############

:ref:`Anonymizer <anonymizer_concept>` is a tool for anonymizing names in text based on given list.


Creation
***************

Parameters
============


**description**:
	Name of the Anonymizer model.

**misspelling_threshold**:
  Minimum required Jaro-Winkler similarity of text matches and true names for anonymizing the matches. Used only if `replace_misspelled_names` is activated.

**replace_misspelled_names**:
  Replace incorrectly spelled names. NB! Might sometimes lead to falsely anonymizing irrelevant entity.

**replace_single_last_names**:
  Replace last names if they occur without first name.

**replace_single_first_names**:
  Replace first names if they occur without last name.

**auto_adjust_threshold**:
  Automatically adjust misspelling threshold if any two names in the given list to anonymize are more similar than configured `misspelling_threshold` to avoid collision errors.

GUI
============


For creating a new Anonymizer, navigate to `"Tools" -> "Anonymizer"` as seen in :numref:`anonymizer_nav`.

.. _anonymizer_nav:
.. figure:: images/anonymizer/anonymizer_nav.png
	:width: 500pt

	*Anonymizer navigation*

If the navigation is successful, you should see a panel similar to :numref:`anonymizer_create_button` with `"Create"` button in the top left corner of the page.

.. _anonymizer_create_button:
.. figure:: images/anonymizer/anonymizer_create_button.png
	:width: 500pt

	*Anonymizer creation button*

Clicking on the `"Create"` button opens a modal window with text `"New Anonymizer"` as depicted in :numref:`anonymizer_new_anonymizer`.

.. _anonymizer_new_anonymizer:
.. figure:: images/anonymizer/new_anonymizer_mw.png
	:width: 500pt

	*Empty Anonymizer creation view*

Fill the required fields as instructed in TODO and click on the `"Create"` button in the bottom right corner of the window (:numref:`anonymizer_create_view`).

.. _anonymizer_create_view:
.. figure:: images/anonymizer/default_anonymizer.png
	:width: 500pt

	*Filled Anonymizer creation view*

The created Anonymizer can now be seen as the first (or only, if no previous Anonymizers exist under the project) row in the table of Anonymizers (:numref:`anonymizer_list`).

.. _anonymizer_list:
.. figure:: images/anonymizer/anonymizer_list.png
	:width: 500pt

	*List of Anonymizers.*

API
============

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
                "mimic_casing": true,
                "auto_adjust_threshold": true
            }'


Usage
**********

GUI
============

Anonymize Text
---------------------

For using an existing Anonymizer to anonymize text, navigate to `"Tools" -> "Anonymizer"` as seen in :numref:`anonymizer_nav`. After successful navigation, you should see a list of existing Anonymizers. Select the Anonymizer you wish to use for anonymization and navigate to options panel as seen in :numref:`anonymizer_actions_0`.

.. _anonymizer_actions_0:
.. figure:: images/anonymizer/anonymizer_actions_0.png
	:width: 500pt

	*Anonymizer options panel location.*

After clicking on the three vertical dots denoting `"Options"`, a small selection menu opens as seen in :numref:`anonymizer_actions_1`. Select option `"Anonymize text"`.

.. _anonymizer_actions_1:
.. figure:: images/anonymizer/anonymizer_actions_1.png

	*Anonymizer -> Anonymize Text*

Clicking on the option opens a modal window with title `"Anonymize text"` with two input fields: `"text"` and `"names"` (:numref:`anonymize_text_empty`).

.. _anonymize_text_empty:
.. figure:: images/anonymizer/anonymize_text_empty.png
	:width: 500pt

	*Empty "Anonymize text" window.*

Write or copy a text containing names to anonymize in the field `"text"` and write or copy a list of newline-separated anonymizable names in format `"last_name, first_name"` in the field below (:numref:`anonymize_text_pre`).

.. _anonymize_text_pre:
.. figure:: images/anonymizer/anonymize_text_pre.png
	:width: 500pt

	*Filled "Anonymize text" window.*

Click on `"Submit"` button in the bottom right corner. The resulting text with anonymized names should appear instantly below the same panel (:numref:`anonymize_text_post`).

.. _anonymize_text_post:
.. figure:: images/anonymizer/anonymize_text_post.png
	:width: 500pt

	*"Anonymize text" result.*



Edit
---------------

TODO  (:numref:`anonymizer_actions_2`).

.. _anonymizer_actions_2:
.. figure:: images/anonymizer/anonymizer_actions_2.png

	*Anonymizer -> Edit*

API
============

Anonymize Text
------------------

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

Anonymize texts
------------------

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


Fine-Tuning
**************
