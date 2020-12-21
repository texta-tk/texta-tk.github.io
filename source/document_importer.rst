`EN <https://docs.texta.ee/document_importer.html>`_
`ET <https://docs.texta.ee/et/document_importer.html>`_

.. _document_importer:

##################
Document Importer
##################

Document importer provides API endpoints for adding, deleting and replacing documents one by one in or into a certain index in an easy way.

Importing a document
*********************

Parameters
===========
**documents**:
	Collection of raw Elasticsearch documents. Each element in the list has following fields:
	
	1. "_id": Under which id should Elasticsearch insert the document, without this Elasticsearch will generate one itself.
	
	2. "_index": Under which already existing index should Elasticsearch insert the document.
	
	3. "_type": Should be the same value as index, specifies the Elasticsearch doc_type.
	
	4. "_source": Actual content of the document.
	
**split_text_in_fields**:
	Specifies which text fields should be split into smaller pieces.
	
.. note::

    If the documents do not have "_index" and "_type" field, the name of the index is generated automatically.
	
	
Examples
=========

Endpoint: **/projects/{project_pk}/document_importer/**

Example with index name added automatically and no splitting:

.. code-block:: bash

  curl -X POST "http://localhost:8000/api/v1/projects/1/document_importer/" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
  -d '{
        "documents": [{"_id": "3", "_source": {"hello": "general kenobi!"}}],
        "split_text_in_fields": []
      }'
      
Example with given index name and splitting:

.. code-block:: bash

  curl -X POST "http://localhost:8000/api/v1/projects/1/document_importer/" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
  -d '{
        "documents": [{"_id": "30", "uuid": "aa15-ghh4-41af-af51", "_index": "texta_test_index", "_type": "texta_test_index", "_source": {"hello": "general kenobi! Here is a very long text that should be splitted", "date": "2015-01-01T12:10:30Z"}}],
        "split_text_in_fields": ["hello"]
      }'
      
Viewing a document
*******************

Endpoint: **projects/{project_pk}/document_importer/{index_name}/{document_id}/**

.. code-block:: bash

  curl -X GET "http://localhost:8000/api/v1/projects/1/document_importer/texta_text_index/30"
 

Deleting a document
********************

Endpoint: **projects/{project_pk}/document_importer/{index_name}/{document_id}/**

.. code-block:: bash

  curl -X DELETE "http://localhost:8000/api/v1/projects/1/document_importer/texta_text_index/30"
  

Updating split document
************************

Parameters
============
**id_field**:
	Which field to use as the ID marker to categorize split documents into a single entity.
**id_value**:
	Value of the ID field by which you categorize split documents into a single entity.
**text_field**:
	Specifies the name of the text field you wish to update.
**content**:
	New content that the old one will be updated with.

Example
========

Endpoint: **projects/{project_pk}/document_importer/{index_name}/update_split**

.. code-block:: bash

  curl -X POST "http://localhost:8000/api/v1/projects/1/document_importer/" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
  -d '{
        "content": "general kenobi! Here is a very long text that should be splitted and now there's more text I forgot to add before and am replacing now",
        "text_field": "hello",
        "id_value": "uuid",
        "id_field": "aa15-ghh4-41af-af51"
      }'
      
      
      
      
      
      
      
      

