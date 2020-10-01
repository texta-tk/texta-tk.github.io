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


API
============

Anonymize text
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
