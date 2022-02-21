`EN <https://docs.texta.ee/document_importer.html>`_
`ET <https://docs.texta.ee/et/document_importer.html>`_

.. _document_importer:

##################
Document Importer
##################

:ref:`Document Importer <document_importer_concept>` (Document Importer) provides API endpoints for adding, deleting and replacing JSON documents inside Elasticsearch indices.

Importing a document
*********************

Adding documents through the API is the easiest way to integrate existing datasets and systems with TEXTA Toolkit.
However, for security reasons the users are only allowed to insert documents into indices which are already
put inside their Project. API users should also be keenly aware that such indices would also need to be set up with a the
proper schema to work with tools like Tagger and Tagger Groups.

Parameters
===========
**documents**:
	Collection of raw Elasticsearch documents. Each element in the list has following fields:
	
	1. "_id": Under which id should Elasticsearch insert the document, without this Elasticsearch will generate one itself.
	
	2. "_index": Under which already existing index should Elasticsearch insert the document.
	
	3. "_type": Specifies the doc_type for Elasticsearch documents, should be manually set to "_doc", defaults to "_doc".
	
	4. "_source": Actual JSON content of the document.
	
**split_text_in_fields**:
	Specifies which text fields should be split into smaller pieces, defaults to a field with the name "text" if none is given. By default the texts are split at a 3000 character limit! Users who do not want to have their documents split should set this field to an empty list.
	
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
        "content": "general kenobi! Here is a very long text that should be splitted and now there is more text I forgot to add before and am replacing now",
        "text_field": "hello",
        "id_value": "uuid",
        "id_field": "aa15-ghh4-41af-af51"
      }'
      
      
      
      
      
      
      
      

