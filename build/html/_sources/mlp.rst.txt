.. _mlp_p:

####
MLP
####

Preprocessing the data is a standard procedure in machine learning which in TTK can be done via MLP (:ref:`MultiLingual Preprocessor <mlp>`) module. 

GUI
****
Navigate to **Tools -> MLP**. Click **Create** button to define a new MLP worker. Select indices and fields on which you want to apply MLP. Since preprocessing the data is quite time-consuming process, it is strongly recommended to select only fields on which applying MLP is actually useful. That is, the fields which you are going to use later to create lexicons or train models on. Lastly, select analyzers which you would like to apply.

.. _create_MLP:
.. figure:: images/create_MLP_worker.png

	*Creating a MLP worker*

The worker adds new fields containing the results to the dataset. You can see the list of fields using Search.

.. _MLP-fields:
.. figure:: images/MLP_fields.png

	*Newly added fields containing results of MLP*
    
    
    
API
****

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

