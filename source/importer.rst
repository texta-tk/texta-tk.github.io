`EN <https://docs.texta.ee/importer.html>`_
`ET <https://docs.texta.ee/et/importer.html>`_

.. _dataset_importer:

##################
Dataset Importer
##################

Dataset Importer is a tool for uploading **JSON Lines**, **CSV** and **Excel** files into :ref:`Elasticsearch <elasticsearch>` to make them accessible for TEXTA Toolkit.

Creation
*********

Parameters:
===========

* description - Normal description to separate any given task from the other ones.
* index - Name of the newly created index, please note that Elasticsearch :ref:`index <index_concept>` naming restrictions apply.
* separator - Only needed for .csv files, defaults to a comma (,). Allows to configure the separator for csv files.
* file - File to import (**JSON Lines**, **CSV**, **Excel**)

.. note::

    As ElasticSearch has some restrictions, the datasete name format has the following constraints:
* Lowercase only
* Cannot include , /, *, ?, ", <, >, |, space (the character, not the word), ,, #
* Indices prior to 7.0 could contain a colon (:), but that's been deprecated and won't be supported in 7.0+
* Cannot start with -, _, +
* Cannot be . or ..
* Cannot be longer than 255 characters

GUI
====

| You can navigate to the Dataset Importer by clicking on the "Dataset Importer" button located under the Tools dropdown menu. (:numref:`importing_loc`).
| Click on the **CREATE** button to open up a new form (:numref:`importing`).

| Here you can:

1. Set a description for the import task
2. Set the Dataset name
3. Specify a separator for **CSV** files (usually a comma)
4. Browse and choose the file to be uploaded by clicking on the folder button.

Click on the **Create** button to start the Importer Task. Upon completion you can add the dataset to your :ref:`project <project_concept>`.

.. _importing_loc:
.. figure:: images/dataset_importer_loc.png
	
	*Navigating to dataset importer*

.. _importing:
.. figure:: images/dataset_importer.png
	
	*Importing a new dataset*

API
====

@ is special syntax for reading the binary of the given file name.

.. code-block:: bash

        curl -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -F "description=Articles" \
        -F "index=en_articles" \
        -F "file=@FILE_NAME.csv" \
        http://localhost:8000/api/v1/projects/11/dataset_imports/
