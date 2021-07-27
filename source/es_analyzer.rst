`EN <https://docs.texta.ee/es_analyzer.html>`_
`ET <https://docs.texta.ee/et/es_analyzer.html>`_

.. _es_analyzer:

######################
ES Analyzer
######################

:ref:`ES Analyzer <es_analyzer_concept>` is a tool for applying various :ref:`Elasticsearch <elasticsearch>` analyzers to :ref:`indices <index_concept>`. Currently supported analyzers are:

- Stemmer
- Tokenizer



Creation
******************


.. _es_analyzer_creation_parameters:

Parameters
============

.. _param_description:

**description**:
	Name of the ES Analyzer application task. This is necessary only for differentiating between all the ES Analyzer tasks in the project.


.. _param_indices:

**indices**:
  List of Elasticsearch :ref:`indices <index_concept>` containing the documents to analyze. NB! Indices should be formatted as list of dicts, where key = "name" and value = <index_name>, e.g:

  .. code-block:: json

    [{"name": "my_dataset"}]


.. _param_fields:

**fields**:
  List of field names (as strings) that are containing the content to analyze.

.. _param_query:

**query**:
  The :ref:`query <query_concept>` restricting the set of documents to analyze. In the API, the query should be formatted as a JSON string. By default empty and all the documents in the chosen indices are analyzed.

.. _param_analyzers:

**analyzers**:
  List of analyzers to be applied. The available options are:

  - "tokenizer" - Tokenizes the content with the tokenizer specified with param ``tokenizer`` and stores the result in a new field with name ``<source_field>_es.tokenized_text``.
  - "stemmer" - Stems the content while using the tokenizer specified with param ``tokenizer`` and stores the result in a new field with name ``<source_field>_es.stems``.


.. _param_tokenizer:

**tokenizer**:
  Tokenizer used for tokenizing the text (used by the stemmer as well!). The available options are:

  - "standard" (default)
  - "keyword"
  - "letter"
  - "lowercase"
  - "whitespace"
  - "uax_url_email"
  - "classic"
  - "thai"

  Read more about the differences between the aformentioned tokenizers `here <https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-tokenizers.html#_word_oriented_tokenizers>`_ (all the tokenizers besides ``keyword``) and `here <https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-tokenizers.html#_structured_text_tokenizers>`_ (``keyword`` tokenizer).


.. _param_stemmer_lang:

**stemmer_lang**:
  Used by the stemmer to determine the correct analyzer to use. If the input set of documents is not monolingual, it is advisable to left this empty and use automatic language detection instead by enabling parameter ``detect_lang``.

  Supported options are:

  .. code-block:: bash

    {
      "ca": "catalan",
      "da": "danish",
      "nl": "dutch",
      "en": "english",
      "fi": "finnish",
      "fr": "french",
      "de": "german",
      "hu": "hungarian",
      "it": "italian",
      "lt": "lithuanian",
      "no": "norwegian",
      "pt": "portuguese",
      "ro": "romanian",
      "ru": "russian",
      "es": "spanish",
      "sv": "swedish",
      "tr": "turkish",
      "ar": "arabic", (Elasticsearch version >= 7)
      "et": "estonian" (Elasticsearch version >= 7)
    }



.. _param_detect_lang:

**detect_lang**:
  Whether or not to detect the language of each document automatically. If the set of documents is monolingual, it is advisable to define the language via parameter ``stemmer_lang`` and turn the automatic language detection off; otherwise it should be enabled.


.. _param_strip_html:

**strip_html**:
  Whether or not to strip the documents from HTML.


.. _param_bulk_size:

**bulk_size**:
   Indicates how many documents are processed per one scroll.


.. _param_es_timeout:

**es_timeout**:
   After how many minutes of processing one batch of documents (n documents in batch = ``bulk_size``) Elasticsearch throws a timeout and the processing is suspended.
