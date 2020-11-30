.. _dataset_importer:

##################
Dataset Importer
##################

Dataset Importer allows the user to insert **jsonlines**, **csv** and **excel** files into :ref:`Elasticsearch <elasticsearch>`.
to make them accessible by the Toolkit. Please note that this process reads the whole
file into the memory and can thus create memory issues when trying to process bigger files. It is advisable to split such
files up into smaller chunks and process each one separately.

This whole process is asynchronous so the response to the call will be instantaneous and it since it takes a bit time
to load the file into the memory, the first 10 seconds might not display any signs of the progress changing.

GUI
****

You can upload a new dataset from a file to Toolkit via Dataset Importer under Tools (see :numref:`importing_loc`).
Click on the **CREATE** button which opens a table in :numref:`importing`. There you can describe your dataset (*Task description*), give it a name (*Dataset name*) and choose the file to be uploaded (you can browse it via the folder button). When uploading an .csv file, you can add the separator (usually a comma). Then hit **Create**. You will see the uploading process and metadata of the dataset under the Dataset Importer in the TTK. You can delete the uploaded dataset by clicking on the three dots under actions. 

Now you can add this data to your :ref:`project <project_concept>` and use it with the name you gave to it. 

.. _importing_loc:
.. figure:: images/dataset_importer_loc.png
	
	*Importing a new dataset*

.. _importing:
.. figure:: images/dataset_importer.png
	
	*Importing a new dataset*

API
****

Parameters:
===========

* description - Normal description to separate any given task from the other ones.
* index - Name of the newly created index, please note that Elasticsearch :ref:`index <index_concept>` naming restrictions apply.
* separator - Only needed for .csv files, defaults to a coma (,). Allows to configure the separator for csv files.


Example:
========

@ is special syntax for reading the binary of the given file name.

.. code-block:: bash

        curl -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -F "description=Articles" \
        -F "index=en_articles" \
        -F "file=@FILE_NAME.csv" \
        http://localhost:8000/api/v1/projects/11/dataset_imports/
        
TODO: how to delete uploaded file?
