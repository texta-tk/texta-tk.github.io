`EN <https://docs.texta.ee/evaluator.html>`_
`ET <https://docs.texta.ee/et/evaluator.html>`_

.. _evaluator:

################
Evaluator
################

:ref:`Evaluator <evaluator_concept>` is a tool for evaluating classification/entity extractor models.





Creation
******************


.. _evaluator_creation_parameters:

Parameters
============


Input parameters
------------------

The following section gives an overview of Evaluator's input parameters.

.. _param_description:

**description**:
	Name of the Evaluator model.

.. _param_indices:

**indices**:
	 List of Elasticsearch :ref:`indices <index_concept>` containing the tags (formatted as :ref:`texta facts <texta_fact>`) to evaluate. NB! Indices should be formatted as list of dicts, where key = "name" and value = <index_name>, e.g:

     .. code-block:: json

       [{"name": "my_dataset"}]

.. _param_query:

**query**:
	 Elasticsearch query :ref:`query <query_concept>` in JSON string format (in API) or as saved :ref:`Search <search_concept>` (in GUI).


.. _param_true_fact_name:

**true_fact_name**:
	 Name of the fact containing the actual label of the document (e.g. "TAG").

.. _param_pred_fact_name:

**predicted_fact_name**:
	 Name of the fact containing the predicted label of the document (e.g. "PREDICTED_TAG").

.. _param_true_fact_value:

**true_fact_value**:
	 Value of the fact containing the actual label of the document (e.g. "sports"). NB! Only necessary for binary classification and should be left empty for mutliclass/multilabel classification.

.. _param_pred_fact_value:

**predicted_fact_value**:
	 Value of the fact containing the predicted label of the document (e.g. "literature"). NB! Only necessary for binary classification and should be left empty for mutliclass/multilabel classification.

.. _param_avg_function:

**average_function**:
	 Sklearn averaging function used while evaluating the results. Available options are:

   * ``macro`` - Calculate metrics for each label, and find their unweighted mean. This does not take label imbalance into account.
   * ``micro`` - Calculate metrics globally by counting the total true positives, false negatives and false positives.
   * ``weighted`` - Calculate metrics for each label, and find their average weighted by support (the number of true instances for each label). This alters `macro` to account for label imbalance; it can result in an F-score that is not between precision and recall.
   * ``binary`` - Only report results for the class specified by pos_label. **NB! Only applicable for binary classification.**
   * ``samples`` - Calculate metrics for each instance, and find their average. **NB! Only applicable for multiclass/multilabel classification.**

.. _param_add_individual_results:

**add_individual_results**:
	 Whether to save individual results for each label separately in addition to the overall (averaged) results.  NB! Only applicable for multiclass/multilabel classification.

  .. note::

  It is generally advisable to enable it for getting a better understanding of the models. However one should be careful if the number of unique labels is very high (>10 000) as it a) will make the evaluation process slower and b) might lead to memory issues.


.. _param_scroll_size:

**scroll_size**:
	 Indicates how many documents are processed per one scroll.

.. _param_es_timeout:

**es_timeout**:
	 Todo


Output parameters
------------------

**n_true_classes**:
	Number of true classes.

**n_predicted_classes**:
	Number of predicted classes.

**n_total_classes**:
	Number of true and predicted classes combined (as a union).

**document_count**:
	Number of evaluated documents.

**evaluation_type**:
	Indicates whether the labelset under the evaluation was binary (type = "binary") or multilabel/multiclass (type = "multilabel").

**score_after_scroll**:
	Binary field indicating whether the scores were calculated for each batch separately and the final result was retrieved by averaging the batch scores. The value of this parameter depends on the number of documents to evaluate (``document_count``), the total size of the label set (``n_total_classes``) and the amount of available memory



.. _evaluator_creation_gui:

GUI
==============

For creating a new BERT Tagger model, navigate to `"Models" -> "Bert Taggers"`. Click on the button **"CREATE"** in the upper left corner of the page (:numref:`bert_tagger_create_button`).

.. _bert_tagger_create_button:
.. figure:: images/bert_tagger/create_button.png
	:align: center

	*BERT Tagger creation button*

After clicking on the button, a new BERT Tagger creation window should open. Fill the required fields and modify the parameters you wish to change, then click on the button **"Create"** in the bottom right corner of the window (:numref:`bert_tagger_create_window`). A new row containing the information about the created tagger should now appear in the list of all BERT taggers with status "created" or "training".

.. _bert_tagger_create_window:
.. figure:: images/bert_tagger/new_bert_tagger.png
	:align: center

	*BERT Tagger creation window*

If the training process is finished (status == "completed"), you can view plots, various training parameters and evaluation results by clicking on the corresponding row.

.. _bert_tagger_row:
.. figure:: images/bert_tagger/btagger_row.png
  :align: center

  *BERT Tagger row*

.. _bert_tagger_plots:
.. figure:: images/bert_tagger/bt_plots.png
  :align: center

  *BERT Tagger's ROC curve and confusion matrix.*

.. _bert_tagger_params:
.. figure:: images/bert_tagger/bt_params.png
  :align: center

  *BERT Tagger's training and validation parameter values.*


.. _bert_tagger_slider:
.. figure:: images/bert_tagger/bt_slider.png
  :align: center

  *BERT Tagger's estimated results with equal number of positive and negative examples.*

.. _bert_tagger_slider_v2:
.. figure:: images/bert_tagger/slider_small.png
	:align: center

	*BERT Tagger's estimated results with low number of positive examples.*




.. _bert_creation_api:

API
==============

Endpoint **/projects/{project_pk}/bert_taggers/**

Example:

.. code-block:: bash

	curl -X POST "http://localhost:8000/api/v1/projects/1/bert_taggers/" \
	-H "accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
	-d '{
      "description": "war_tagger",
      "query":"{\"query\":{\"bool\":{\"must\":[],\"filter\":[],\"must_not\":[],\"should\":[{\"bool\":{\"must\":[{\"bool\":{\"should\":[{\"multi_match\":{\"query\":\"war\",\"type\":\"best_fields\",\"slop\":\"0\",\"fields\":[\"article_tags\"]}}],\"minimum_should_match\":1}}]}}],\"minimum_should_match\":1}}}",,
      "fields": ["article_text"],
      "indices": [{"name": "sputnik_en"}],
      "bert_model": "bert-base-cased",
      "max_length": 64
  }'

Response:

.. code-block:: json

  {
    "url": "https://rest-dev.texta.ee/api/v1/projects/291/bert_taggers/13/",
    "author_username": "masula",
    "id": 13,
    "description": "war",
    "query": "{\"query\":{\"bool\":{\"must\":[],\"filter\":[],\"must_not\":[],\"should\":[{\"bool\":{\"must\":[{\"bool\":{\"should\":[{\"multi_match\":{\"query\":\"war\",\"type\":\"best_fields\",\"slop\":\"0\",\"fields\":[\"article_tags\"]}}],\"minimum_should_match\":1}}]}}],\"minimum_should_match\":1}}}",
    "fields": [
        "article_text"
    ],
    "f1_score": 0.8680497925311204,
    "precision": 0.8262243285939969,
    "recall": 0.9143356643356644,
    "accuracy": 0.8633433605500644,
    "validation_loss": 0.3219001277039448,
    "training_loss": 0.27729326468897597,
    "maximum_sample_size": 10000,
    "minimum_sample_size": 50,
    "num_epochs": 2,
    "plot": "https://rest-dev.texta.ee/data/media/30ea13659e9311ca86faa5cbe2943e.png",
    "task": {
        "id": 154069,
        "status": "completed",
        "progress": 100.0,
        "step": "",
        "errors": "[]",
        "time_started": "2021-02-12T14:01:16.878193+02:00",
        "last_update": null,
        "time_completed": "2021-02-12T14:09:05.597654+02:00",
        "total": 0,
        "num_processed": 0
    },
    "fact_name": null,
    "indices": [
        {
            "id": 9,
            "is_open": true,
            "url": "https://rest-dev.texta.ee/api/v1/index/9/",
            "name": "sputnik_en"
        }
    ],
    "bert_model": "bert-base-uncased",
    "learning_rate": 2e-05,
    "eps": 1e-08,
    "max_length": 64,
    "batch_size": 32,
    "adjusted_batch_size": 26,
    "split_ratio": 0.8,
    "negative_multiplier": 1.0,
    "num_examples": "{\"true\": 5816, \"false\": 5816}",
    "confusion_matrix": "[[1046, 98], [220, 963]]"
  }


Usage
********

The following section covers all functions supported by BERT Tagger.


Download Pretrained Model
===========================

`"download_pretrained_model"` allows downloading pretrained BERT models available in `Hugging Face <https://huggingface.co/models>`_.

.. note::

  Downloading the model might take some time (but usually not over 30 seconds), so be patient if nothing seems to happen at first!

GUI
------------

TODO



API
------------

Endpoint **/projects/{project_pk}/bert_taggers/download_pretrained_model/**

Example:

.. code-block:: bash

  curl -X DELETE "http://localhost:8000/api/v1/projects/1/bert_taggers/131/" \
       -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"
       -H "Content-Type: application/json" \
       -d '{
           "bert_model": "gilf/english-yelp-sentiment"
         }'


Response (negative):

.. code-block:: json

  "Download finished."




Tag Random Doc
================

`"Tag Random Doc"` allows applying a BERT tagger model to a random document in an index.

Parameters
------------

**indices**
  List of indices from where the random document is retrieved. Default to the indices used for training the model.

**fields**
  List of document fields onto which the tagger will be applied. Default to the fields used for training the model.

GUI
------------

TODO

API
------------


Endpoint **/projects/{project_pk}/bert_taggers/{id}/tag_random_doc/**

Example:

.. code-block:: bash

	curl -X POST "http://localhost:8000/api/v1/projects/1/bert_taggers/138/tag_random_doc/" \
	-H "accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
	-d '{}'

Response:

.. code-block:: json

  {
      "document": {
          "rubric": "Military & Intelligence",
          "outgoing_links": "['http://sputniknews.com/tags/tag_AlexanderLukashenko/']",
          "footnotes": "[]",
          "url": "https://sputniknews.com/military/201606161041450650-polonez-rocket-system/",
          "_texta_id": "/var/www/texta/texta/files/dataset_importer/1538327995501026/sputnik_en.csv_175912",
          "creation_string": "16:18 16.06.2016",
          "time": "16:18",
          "title": "Polonez: Belarus Successfully Test-Fires New Multiple Rocket Launch System",
          "date": "2016-06-16",
          "article_text": "MINSK (Sputnik) — Belarus has successfully tested its newly developed Polonez multiple launch rocket system, Belarusian President  Alexander Lukashenko  said Thursday. \n \"This is a happy day is terms of security and defense. With a minuscule amount of funding allocated, our military was able to develop and test what has today become Belarusian-made missile armaments. The rocket systems have been launched,\" Lukashenko said during a meeting with Belarusian Prime Minister Andrei Kobyakov and National Bank of Belarus Head Pavel Kallaur, as quoted by the Belarusian Telegraph Agency (BelTA). \n \n                        ©\n                    Sputnik/ Pavel Lisitsyn Iron Fist: Russian Uragan Multiple Rocket Launcher Becoming Deadlier The first missile hit its target with a 1.5 meter (5 foot) accuracy, while the second missile reached its target with a 10-meter accuracy, he added, praising the result and stressing that the system was created within the last two years.\n The prime minister was instructed to award those contributing to the development of the missile system, according to the media outlet. \n The Polonez system was first unveiled at the May 9, 2015 Victory Day Parade in Minsk.",
          "article_lead": "The Belarusian Polonez multiple launch rocket system has successfully passed tests, President Alexander Lukashenko said.",
          "article_tags": "['Polonez MLRS', 'Alexander Lukashenko', 'Belarus']",
          "texta_facts": [
              {
                  "spans": "[[0, 0]]",
                  "str_val": "refugees",
                  "fact": "TEXTA_TAG",
                  "doc_path": "article_text"
              }
          ]
      },
      "prediction": {
          "probability": 0.8746703267097473,
          "tagger_id": 13,
          "result": "false"
      }
  }



Tag Text
================

`"Tag Text"` enables tagging a single text with a fine-tuned BERT Tagger model.

GUI
-----------

TODO


API
------------

Endpoint **/projects/{project_pk}/bert_taggers/{id}/tag_text/**

Example:

.. code-block:: bash

				curl -X POST "http://localhost:8000/api/v1/projects/1/bert_taggers/131/tag_text/" \
				-H "accept: application/json" \
				-H "Content-Type: application/json" \
				-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
				-d '{
					"text": "Ignorance is bliss, right? According to the official US estimates, approximately 2 million civilians died in the Vietnam War while NGOs put death toll at nearly 4 million."
				    }'

Response:

.. code-block:: json

  {
      "probability": 0.9773088097572327,
      "tagger_id": 131,
      "result": "true"
  }


Available Models
==================

`"Available Models"` returns a list of currently available pretrained BERT models.

API
------------

Endpoint **/projects/{project_pk}/bert_taggers/available_models/**

Example:

.. code-block:: bash

				curl -X GET "http://localhost:8000/api/v1/projects/1/available_models/" \
				-H "Content-Type: application/json" \
				-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"



Response:

.. code-block:: json

  [
      "bert-base-multilingual-cased",
      "EMBEDDIA/finest-bert",
      "bert-base-uncased",
      "tartuNLP/EstBERT",
      "textattack/bert-base-uncased-imdb",
      "unitary/toxic-bert",
      "ProsusAI/finbert",
      "distilbert-base-uncased-finetuned-sst-2-english",
      "prajjwal1/bert-tiny",
      "gilf/english-yelp-sentiment"
  ]

.. note::

  The list will vary depending on which models have been downloaded.


Epoch Reports
================

`"Epoch Reports"` returns a list of reports of the results at end of each epoch. The number of reports == value of param `num_epochs`.

GUI
------------

TODO

API
------------


Endpoint **/projects/{project_pk}/bert_taggers/{id}/epoch_reports/**

Example:

.. code-block:: bash

	curl -X GET "http://localhost:8000/api/v1/projects/1/bert_taggers/138/epoch_reports/" \
	-H "Content-Type: application/json" \
	-H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \


Response (positive):

.. code-block:: json

  [
    {
        "f1_score": 0.86351,
        "precision": 0.79255,
        "recall": 0.94843,
        "confusion_matrix": [
            [
                1085,
                59
            ],
            [
                284,
                899
            ]
        ],
        "accuracy": 0.8526,
        "training_loss": 0.40053,
        "validation_loss": 0.34498,
        "training_time": "0:02:21",
        "validation_time": "0:00:10",
        "area_under_curve": 0.93035,
        "classes": [
            "true",
            "false"
        ],
        "epoch": 1
    },
    {
        "f1_score": 0.86805,
        "precision": 0.82622,
        "recall": 0.91434,
        "confusion_matrix": [
            [
                1046,
                98
            ],
            [
                220,
                963
            ]
        ],
        "accuracy": 0.86334,
        "training_loss": 0.27729,
        "validation_loss": 0.3219,
        "training_time": "0:02:22",
        "validation_time": "0:00:10",
        "area_under_curve": 0.93728,
        "classes": [
            "true",
            "false"
        ],
        "epoch": 2
    }
  ]
