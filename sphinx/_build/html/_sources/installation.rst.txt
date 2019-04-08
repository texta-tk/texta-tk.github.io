.. _installation:

Installation
====================

.. note::

    Installation instructions are currently only for Debian based Linux distributions and tested on Ubuntu.

Downloading
-----------
    
TEXTA can be downloaded from Git repository. If you are missing *git*, you can download it with

.. code-block:: bash

    sudo apt-get -y install git
    

.. code-block:: bash

    git clone https://github.com/ekt68/texta.git


This generates a directory called *texta*, which contains the code base.
    
Resolving system-wide dependencies
----------------------------------
First lets update our aptitude's package list to get the most up-to-date software versions.

.. code-block:: bash

    sudo apt-get update
    
To compile some of the Python libraries, we need the Python header files, which are included in *python-dev* package.
    
.. code-block:: bash

    sudo apt-get -y install python-dev
    
For speeding up *gensim* and *scipy* modules, we have to download the following libraries.

.. code-block:: bash

    sudo apt-get -y install build-essential manpages-dev
    sudo apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran    

    
Resolving Python dependencies
-----------------------------

Next, we need to get the Python libraries that TEXTA relies on.

Virtual Python environment
++++++++++++++++++++++++++

Since TEXTA is a Python application, we highly recommend to use a virtual Python environment. This is due to the fact that Python stores its
libraries globally and if some other Python application shares libraries with TEXTA, but they use incompatible versions, 
the previously installed application might seize to work.

.. note::

    If you are not concerned about potential Python library conflicts between several applications, you can skip this part and head on to
    `installing Python dependencies`_.

Two frequently used Python sandbox tools are `Anaconda <https://www.anaconda.com/distribution/#download-section>`_ and 
`Virtualenv <https://virtualenv.pypa.io/en/stable/>`_. Both allow to create a local version of Python interpreter by duplicating Python
executables and libraries. In this section we cover *Anaconda*, as it enables to install many precompiled libraries with

.. code-block:: bash

    conda install python_library_name

and therefore is significantly faster than *virtualenv*. However, not all third-party libraries are available. In this case we still have to
use *pip* or one of its alternatives.

Installation instructions are at `Anaconda <https://www.anaconda.com/distribution/#download-section>`_.

To create a new *Anaconda* environment called *texta* that uses Python 3.5, we issue the command

.. code-block:: bash

    conda create --name texta python=3.5

.. note::

    It's a good practice to give environments descriptive names and to create an environment for each separate application. In our case we
    created an environement called "texta".
    
After we have created the environment, we have to activate it. Activating an environment changes the current terminal session's paths to switch
the original Python's executables to that of the isolated environment's.

.. code-block:: bash

    source activate texta

    
.. _`installing Python dependencies`:    
    
Installing Python dependencies
++++++++++++++++++++++++++++++


The following code block lists all the Python libraries that TEXTA depends on along with Python's library downloading tool *pip*'s commands.

3rd party Python libraries can be installed with package management systems such as *Anaconda* or *pip*. 

Installing with Anaconda. This will create an 'texta-toolkit' environment in Anaconda:

.. code-block:: bash

    texta_root_dir$ conda env create -f conda-environment.yaml
    texta_root_dir$ source activate texta-toolkit	

With pip:

.. code-block:: bash

    texta_root_dir$ pip install -r requirements.txt

.. note:: `sudo pip install -r requirements.txt` if not using conda or virtualenv

Elasticsearch
-------------

TEXTA uses `Elasticsearch <https://www.elastic.co/products/elasticsearch>`_ to store and query data. Elasticsearch allows full-text indexing,
meaning that not only can we query by specific columns, but we can also query documents using specific words or phrases in a column.

Elasticsearch behaves like a RESTful server, which accepts queries with JSON data. The server can either run locally or remotely.
Small datasets can be maintained on personal computer, while gigabytes of data should preferably be kept on a remote server. It is vital to
configure Elasticsearch's address if remote approach is used.

In Elasticsearch terminology a database is called an index and table is called either mapping or type.
    
Elasticsearch can be downloaded from `here <https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.0.deb>`_. We are using the .deb package (to open, use *dpkg -i elasticsearch-6.6.0.deb* command. One should also have Java installed (*apt-get install default-jre*)). 

Before running the Texta Toolkit Elasticsearch should be started with the command below.

.. code-block:: bash

    texta_root_dir$ service elasticsearch start


.. _final-touches:
    
Final touches
-------------

All that is left is to synchronize database state by running

.. code-block:: bash

    texta_root_dir$ python migrate.py

Adding *purge_migrations* to the command deletes old migrations if needed. *migrate.py* command creates a superuser automatically (username: admin, password: 1234). One can create a superuser with this command also:

.. code-block:: bash

    texta_root_dir$ python migrate.py createsuperuser

.. _example-dataset:
    
Example dataset
---------------

TEXTA comes with example dataset to play around with. After Elasticsearch has been started and the correct Elasticsearch URL has been set in
:ref:`configuration steps <configuration>`, we have to run 

.. code-block:: bash

    texta_root_dir$ python scripts/example/example_import.py

.. _running-texta:
    
Running TEXTA
-------------

To start TEXTA on localhost:8000, it suffices to run

.. code-block:: bash

    texta_root_dir$ python manage.py runserver
    
If we want to run on some other network interface or port, we can specify it via IP-port pair.

.. code-block:: bash

    texta_root_dir$ python manage.py runserver localhost:80
    texta_root_dir$ python manage.py runserver 0.0.0.0:8080
    
