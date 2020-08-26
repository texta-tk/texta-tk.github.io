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


Tagger Groups
-------------

Train a new tagger group
++++++++++++++++++++++++

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
++++++++

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

Torch Tagger
-------------

Train a new Torch Tagger
++++++++++++++++++++++++

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
