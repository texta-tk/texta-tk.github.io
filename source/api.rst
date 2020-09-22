`EN <https://docs.texta.ee/api.html>`_
`ET <https://docs.texta.ee/et/api.html>`_

Tutorial: Using Toolkit via API
===============================

The purpose of this tutorial is to get you started with using Toolkit API.
The tutorial gives you an overview of the most fundamental API operations together with illustrating examples.
For more detailed documentations please see :ref:`API reference <api_reference>`.


Health of Toolkit
-----------------

For checking the health of a running Toolkit instance, one can access the **/health** endpoint for operating statistics.
The endpoint responds with information abouth the availability of services (e.g. Elasticsearch and TEXTA MLP) and system resources (e.g. disk, memory, GPU usage, etc.).

.. literalinclude:: files/health.json

Registration
--------------

Endpoint: **/rest-auth/registration/**

Example:

.. code-block:: bash

    curl -X POST "http://localhost:8000/api/v1/rest-auth/registration/" \
    -H  "accept: application/json" \
    -H  "Content-Type: application/json" \
    -d '{
            "username": "myname",
            "email": "myname@example.com",
            "password1": "a123s456789",
            "password2": "a123s456789"
        }'

Response:

.. code-block:: json

    {"key":"7cd98b388e85b82bd084c80418d56a185b3a35ba"}

Response is the Token key that you will later need to authenticate requests.


Logging in
--------------

Endpoint: **/rest-auth/login/**

Example:

.. code-block:: bash

    curl -X POST "http://localhost:8000/api/v1/rest-auth/login/" \
    -H "Content-Type: application/json" \
    -d '{
            "username": "admin",
            "password": "1234"
        }'

Response:

.. code-block:: json

    {"key":"8229898dccf960714a9fa22662b214005aa2b049"}

Response is the Token key that you will later need to authenticate requests.


Projects
-------------

Create a new project
++++++++++++++++++++

Endpoint: **/projects/**

Example:

.. code-block:: bash

    curl -X POST "http://localhost:8000/api/v1/projects/" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
    -d '{
            "title": "My project",
            "users": ["http://localhost:8000/api/v1/users/1/"],
            "indices": ["texta_test_index"]
        }'


Anonymizers
-------------

Create a new anonymizer
+++++++++++++++++++++++++

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


Anonymize text
++++++++++++++++

Endpoint **/projects/{project_pk}/anonymizers/{id}/anonymize_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/anonymizers/1/anonymize_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "Bonnie Parker and Clyde Barrow are believed to have murdered at least nine police officers.",
                "names": ["Parker, Bonnie Elizabeth", "Chestnut Barrow, Clyde"]
            }'

Response:

.. code-block:: json

    "N.Q and X.R are believed to have murdered at least nine police officers."

Anonymize texts
++++++++++++++++

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
               "names": ["Parker, Bonnie Elizabeth", "Chestnut Barrow, Clyde"],
               "consistent_replacement": true
            }'

Response:

.. code-block:: json

        [
            "F.Q and T.T are believed to have murdered at least nine police officers.",
            "F.Q and T.T were killed in May 1934."
        ]

MLP
----

Apply MLP to texts
+++++++++++++++++++++

Endpoint: **/mlp/texts/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/embeddings/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "texts": ["Mis su nimi on?", "Ettepanek minna üle neljapäevasele töönädalale lükati tagasi."]
            }'

Response:

.. code-block:: json

        [
            {
                "text": {"text":"Mis su nimi on ?","lang":"et","lemmas":"mis sina nimi olema ?","pos_tags":"P P S V Z"},
                "texta_facts":[]
            },
            {
                "text": {"text":"Ettepanek minna üle neljapäevasele töönädalale lükati tagasi .","lang":"et","lemmas":"ettepanek minema üle neljapäevane töönädal lükkama tagasi .","pos_tags":"S V K A S V D Z"},
                "texta_facts":[]
            }
        ]

Embeddings
----------

Train a new embedding
+++++++++++++++++++++

Endpoint: **/projects/{project_pk}/embeddings/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/embeddings/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My embedding",
                "indices": [{"name": "texta_test_index"}],
                "fields": ["comment_content_lemmas"],
                "num_dimensions": 100,
                "max_documents": 10000,
                "min_freq": 5
            }'

Taggers
-------

Train a new tagger
++++++++++++++++++

Endpoint: **/projects/{project_pk}/taggers/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/taggers/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My tagger",
                "fields": ["comment_content_lemmas"],
                "vectorizer": "Hashing Vectorizer",
                "classifier": "Logistic Regression",
                "indices": [{"name": "texta_test_index"}]
            }'

Tag text
++++++++

Endpoint **/projects/{project_pk}/taggers/{id}/tag_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/taggers/2/tag_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "mis su nimi on?",
                "lemmatize": true
            }'

Response:

.. code-block:: json

        {
            "tag":"My tagger",
            "probability":0.9898217973842874,
            "tagger_id":2,
            "result":true
        }

Regex Taggers
--------------

Create a new Regex Tagger
+++++++++++++++++++++++++++

Endpoint: **/projects/{project_pk}/regex_taggers/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_taggers/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My regex tagger",
                "lexicon": ["cat"],
                "counter_lexicon": ["no", "not"],
                "operator": "or",
                "match_type": "prefix",
                "required_words": 1.0,
                "phrase_slop": 0,
                "counter_slop": 2,
                "n_allowed_edits": 0,
                "return_fuzzy_match": true,
                "ignore_case": true,
                "ignore_punctuation": false

            }'

Tag doc
++++++++++++++++

Endpoint **/projects/{project_pk}/regex_taggers/{id}/tag_doc/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_taggers/1/tag_doc/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "doc": {"text": "If you are allergic to a thing, it is best not to put that thing in your mouth, particularly if the thing is cats.", "id": 12},
                "fields": ["text"]
            }'

Response:

.. code-block:: json

      {
        "tagger_id": 1,
        "description": "My regex tagger",
        "result": true,
        "matches": [
            {
                "str_val": "cats",
                "spans": [
                    109,
                    113
                ],
                "description": "My regex tagger",
                "tagger_id": 1
            }
        ]
      }

Tag random doc
++++++++++++++++

Endpoint **/projects/{project_pk}/regex_taggers/{id}/tag_random_doc/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_taggers/1/tag_random_doc/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "indices": [{"name": "kliinik_ee"}],
                "fields": ["kysimus_ja_vastus"]
            }'

Response:

.. code-block:: json

        {
            "tagger_id": 1,
            "description": "My regex tagger",
            "result": true,
            "matches": [
                {
                    "str_val": "cats",
                    "spans": [
                        109,
                        113
                    ],
                    "description": "My regex tagger",
                    "tagger_id": 1
                }
            ],
            "texts": [
        	"If you are allergic to a thing, it is best not to put that thing in your mouth, particularly if the thing is cats."
            ]
        }


Tag text
+++++++++

Endpoint **/projects/{project_pk}/regex_taggers/{id}/tag_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_taggers/1/tag_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "If you are allergic to a thing, it is best not to put that thing in your mouth, particularly if the thing is cats.",
            }'

Response:

.. code-block:: json

      [
          {
              "str_val": "cat",
              "spans": [
                  109,
                  113
              ]
          }
      ]

Tag texts
++++++++++

Endpoint **/projects/{project_pk}/regex_taggers/{id}/tag_texts/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_taggers/1/tag_texts/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "texts": ["Black cats and white rats.", "Dogs dogs dogs."]
            }'

Response:

.. code-block:: json

        [
            [
                {
                    "str_val": "cats",
                    "spans": [
                        6,
                        10
                    ]
                }
            ],
            []
        ]

Tagger Groups
--------------------

Train a new tagger group
++++++++++++++++++++++++++++++++++++++

Endpoint: **/projects/{project_pk}/tagger_groups/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/tagger_groups/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My tagger group",
                "fact_name": "TEEMA",
                "tagger":
                        {
                            "fields": ["comment_content_lemmas"],
                            "vectorizer": "TfIdf Vectorizer",
                            "classifier": "Logistic Regression",
                            "indices": [{"name": "texta_test_index"}]
                        }
            }'

Tag text
+++++++++++++++++++++++++

Endpoint: **/projects/{project_pk}/tagger_groups/{id}/tag_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/tagger_groups/1/tag_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "AINUS ettepanek - alla põhihariduse isikutele sõidulubasid mitte anda - sai kriitika osaliseks.",
                "lemmatize": true,
                "n_similar_docs": 10,
                "n_candidate_tags": 10
            }'

Response:

.. code-block:: json

        [
            {
                "tag": "foo",
                "probability": 0.6659222999240199,
                "tagger_id": 4,
                "result": true
            },
            {
                "tag": "bar",
                "probability": 0.5107991699285356,
                "tagger_id": 3,
                "result": true
            }
        ]

Regex Tagger Groups
--------------------------------

Create a new regex tagger group
+++++++++++++++++++++++++++++++++++++++++

Endpoint: **/projects/{project_pk}/regex_tagger_groups/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_tagger_groups/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "regex_taggers": [92, 93, 94],
                "description": "animals"
            }'

Response:

.. code-block:: json

    {
        "id": 3,
        "url": "https://rest-dev.texta.ee/api/v1/projects/2/regex_tagger_groups/1/",
        "regex_taggers": [
            92,
            93,
            94
        ],
        "author_username": "my_username",
        "task": null,
        "description": "animals",
        "tagger_info": [
            {
                "tagger_id": 92,
                "description": "cat"
            },
            {
                "tagger_id": 93,
                "description": "dog"
            },
            {
                "tagger_id": 94,
                "description": "horse"
            }
        ]
    }

Apply regex tagger group
+++++++++++++++++++++++++++++++++++++++++++


Endpoint: **/projects/{project_pk}/regex_tagger_groups/{id}/apply_tagger_group/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_tagger_groups/1/apply_tagger_group/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
              "description": "Apply my regex tagger group",
              "indices": [{"name": ""}],
              "fields": [],
              "query": null

            }'

Response:

.. code-block:: json



Tag doc
++++++++++++++++++++


Endpoint: **/projects/{project_pk}/regex_tagger_groups/{id}/tag_doc/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_tagger_groups/1/tag_doc/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "doc": {"text": "Black cats and white dogs.", "id": 1},
                "fields": ["text"]
            }'

Response:

.. code-block:: json

      {
          "tagger_group_id": 1,
          "description": "animals",
          "result": true,
          "matches": [
              {
                  "str_val": "cats",
                  "spans": [
                      6,
                      10
                  ],
                  "description": "cat",
                  "tagger_id": 92
              },
              {
                  "str_val": "dogs",
                  "spans": [
                      21,
                      25
                  ],
                  "description": "dog",
                  "tagger_id": 93
              }
          ]
      }

Tag random doc
++++++++++++++++++++++++++


Endpoint: **/projects/{project_pk}/regex_tagger_groups/{id}/tag_random_doc/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_tagger_groups/1/tag_random_doc/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "indices": [],
                "fields": []
            }'

Response:

.. code-block:: json

Tag text
+++++++++++++++++++++


Endpoint: **/projects/{project_pk}/regex_tagger_groups/{id}/tag_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_tagger_groups/1/tag_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "Black cats and white dogs."
            }'

Response:

.. code-block:: json

          {
              "tagger_group_id": 1,
              "description": "animals",
              "result": true,
              "matches": [
                  {
                      "str_val": "cats",
                      "spans": [
                          6,
                          10
                      ],
                      "description": "cat",
                      "tagger_id": 92
                  },
                  {
                      "str_val": "dogs",
                      "spans": [
                          21,
                          25
                      ],
                      "description": "dog",
                      "tagger_id": 93
                  }
              ]
          }

Tag texts
++++++++++++++++++


Endpoint: **/projects/{project_pk}/regex_tagger_groups/{id}/tag_texts/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/regex_tagger_groups/1/tag_texts/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "texts": ["Black cats and white dogs", "Plains and trains.", "Knights and horses." ]
            }'

Response:

.. code-block:: json



Torch Tagger
-------------

Train a new Torch Tagger
++++++++++++++++++++++++++

Endpoint: **/projects/{project_pk}/torchtaggers/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/torchtaggers/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My Torch Tagger",
                "fields": ["comment_content_clean.text"],
                "model_architecture": "TextRNN",
                "embedding": 2,
                "num_epochs": 5,
                "fact_name": "TEEMA",
                "indices": [{"name": "texta_test_index"}]
            }'

Tag text
++++++++

Endpoint: **/projects/{project_pk}/torchtaggers/{id}/tag_text/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/torchtaggers/1/tag_text/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "text": "AINUS ettepanek - alla põhihariduse isikutele sõidulubasid mitte anda - sai kriitika osaliseks.",
                "lemmatize": false
            }'

Response:

.. code-block:: json

        {
            "result": "foo",
            "probability": 0.36259710788726807
        }


Dataset Importer
----------------

This module allows the user to insert jsonlines, csv and excel files into Elasticsearch
to make them accessible by the Toolkit. Please note that this process reads the whole
file into the memory and can thus create memory issues when trying to process bigger files, it is advisable to split such
files up into smaller chunks and process each one separately.

This whole process is asynchronous so the response to the call will be instantaneous and it since it takes a bit time
to load the file into the memory, the first 10 seconds might not display any signs of the progress changing.

Parameters:
+++++++++++

* description - Normal description to separate any given task from the other ones.
* index - Name of the newly created index, please note that Elasticsearch index naming restrictions apply.
* separator - Only needed for .csv files, defaults to a coma (,). Allows to configure the separator for csv files.


Example:

@ is special syntax for reading the binary of the given file name.

.. code-block:: bash

        curl -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -F "description=Articles" \
        -F "index=en_articles" \
        -F "file=@FILE_NAME.csv" \
        http://localhost:8000/api/v1/projects/11/dataset_imports/

Browsable API
-------------

* http://localhost:8000/api/v1/

TODO

.. _api_reference:

API Reference
-------------

Reference for Toolkit API is available when running the Toolkit:

* http://localhost:8000/api/v1/swagger/

* http://localhost:8000/api/v1/redoc/
