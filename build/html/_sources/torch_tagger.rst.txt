#############
Torch Tagger
#############

Creation
********

GUI
====

API
===
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


Useage
********

GUI
====

API
===

Application
************

GUI
====

API
===

Tag text
---------

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
Fine-Tuning
***********

Siia tulevad parameetrid.

GUI
====

API
===
