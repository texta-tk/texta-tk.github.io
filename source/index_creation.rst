#########
Index API
#########

Index API is the TEXTA Toolkits way of interfacing with Elasticsearch's index creation API.

.. note::
    For security reasons, endpoints related to the Index API are only accessible by superusers!


Synchronize indices
===================

To facilitate permissions between users and datasets in Elasticsearch, it's necessary to keep a copy of the indices names
in TEXTA Toolkits database. This is not a problem if you create all the indices through TEXTA Toolkit, but might become problematic
for systems that interact with Elasticsearch directly.

Although these situation are generally handled by periodic synchronization processes, it's also possible to start said process
manually for a more on-demand approach.

This will make sure that all the indices you want TEXTA Toolkit to use will be available to the application.

Endpoint: **/index/sync_indices/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/index/sync_indices/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"


Create indices
==============


**name**:
    Name of the index, follows requirements of Elasticsearch's naming convention. Avoid creating indices that start with a [dot] prefix (*Required field*).

**description**:
    Simple plain-text description of the indexes content (*Optional field*).

**is_open**:
    Whether to create the index open or closed. Closed indices can not be operated on (*Defaults to True*).

**added_by**:
    Plain-text for who is responsible for the indexes creation.

**test**:
    Boolean for whether the index is created for testing or experimental purposes (*Optional field*).

**source**:
    Plain-text for where the data originates from (*Optional field*).

**client**:
    Plain-text owner of the index in production settings (*Optional field*).

**domain**:
    Multiple-choice field for the domain/category of data the index contains. Options are limited to: emails, news_articles, comments, court_decisions, tweets, forum_posts, formal_documents, others (*Optional field*).



Endpoint: **/index/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/index/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "name": "test_index",
                "test": true,
                "description": "Index for common experiments"
            }'




List indices
============
Returns a list of ALL indices that have been synchronized with Elasticsearch.
In very huge clusters with many indices, the response for this endpoint might take time since it does not implement pagination.

.. code-block:: bash

        curl -X GET "http://localhost:8000/api/v1/index/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"


Response:

.. code-block:: json-object

    [
        {
        "id": 1,
        "is_open": true,
        "url": "http://localhost:8000/api/v1/index/1/",
        "name": "test_index",
        "description": "Index for common experiments",
        "added_by": "",
        "test": true,
        "source": "",
        "client": "",
        "domain": "",
        "created_at": "2022-01-05T14:46:16.194000+02:00",
        "size": 125,
        "doc_count": 0,
        "has_validated_facts": true
        }
    ]


Index details
=============
Returns basic information about an index like its name, metadata, size on disk, whether it has a proper fact mapping etc.

Endpoint: **/index/{index_id}/**

Example:

.. code-block:: bash

        curl -X GET "http://localhost:8000/api/v1/index/1/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"

Response:

.. code-block:: json-object
    {
      "id": 1,
      "is_open": true,
      "url": "http://localhost:8000/api/v1/index/1/",
      "name": "test_index",
      "description": "Index for common experiments",
      "added_by": "",
      "test": true,
      "source": "",
      "client": "",
      "domain": "",
      "created_at": "2022-01-05T14:46:16.194000+02:00",
      "size": 125,
      "doc_count": 0,
      "has_validated_facts": true
    }



Close index
-----------
When an index is no longer in use for extended periods of time, it's best to close them to avoid them hogging
up resources.

Endpoint: **/index/{index_id}/close_index/**

Example:

.. code-block:: bash

        curl -X PATCH "http://localhost:8000/api/v1/index/1/close_index/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"


Open index
----------
Opens up closed indices for whenever they need to be used again after being closed.

Endpoint: **/index/{index_id}/open_index/**

Example:

.. code-block:: bash

        curl -X PATCH "http://localhost:8000/api/v1/index/1/open_index/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"



Add Texta Facts mapping
-----------------------

Certain features in TEXTA Toolkit like the Tagger and Tagger Groups depend on the schema of the Texta Facts
field in the indices, this endpoint exists to add said schema to its corresponding index.

This endpoint can be called out multiple times, for the first call the schema in Elasticsearch is updated and for
every next one it is ignored.

Endpoint: **/index/{index_id}/add_facts_mapping/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/index/1/add_facts_mapping/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"



Delete indices
==============

Deletes the index from Elasticsearch and removes them from Projects.

.. note::
    **THIS OPERATION IS NOR REVERSIBLE AND SHOULD BE HANDLED WITH CAUTION!**


Endpoint: **/index/{index_id}/**

Example:

.. code-block:: bash

        curl -X DELETE "http://localhost:8000/api/v1/index/1/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"

