`EN <https://docs.texta.ee/installation.html>`_
`ET <https://docs.texta.ee/et/installation.html>`_


.. _installation:

Installation
============

Installation Using Docker (recommended)
---------------------------------------

.. note::

    Currently all installation examples for system dependencies are only shown for Debian-based systems.

Install Docker
++++++++++++++

The easiest way to run TEXTA Toolkit is to use prebuilt Docker images from TEXTA registries. For that, one needs to install *Docker* and *docker-compose*:

.. code-block:: bash

    sudo apt-get update
    sudo apt-get install docker docker-compose -y

To run :ref:`Elasticsearch <elasticsearch>` in Docker, one needs to increase maximum map count parameter for virtual memory:

.. code-block:: bash

    sudo sysctl -w vm.max_map_count=262144

Configure docker-compose
++++++++++++++++++++++++

The ecosystem is built using *docker-compose*. This is all defined in a file called **docker-compose.yaml**.
To successfully run TEXTA Toolkit one needs to define following services:

* :ref:`Elasticsearch <elasticsearch>` for storing the documents (one can also run it without Docker)

* Redis for managing message queues in TK (one can also run it without Docker)

* MySQL or Postgres for storing user and :ref:`project <project_concept>` data (can also be run without Docker)

* TEXTA Toolkit RESTful API & GUI: docker.texta.ee/texta/texta-rest:latest

For executing aforementioned services one needs to have preconfigured **docker-compose.yaml** file:

.. literalinclude:: files/docker-compose.yaml

The compose file is used in combination with **env** file located in the same directory as *docker-compose.yaml* containing environment variables needed for operating TEXTA Toolkit:

.. literalinclude:: files/env

Run TEXTA Toolkit
+++++++++++++++++

.. note::
    Before running TEXTA Toolkit, one should have 2 files in current working directory:

    * docker-compose.yaml

    * env

With the **docker-compose.yaml** and **env** files present and accounted for, pull the images and start the services by executing the following commands in the same directory with **docker-compose.yaml** and **env**:

.. code-block:: bash

    sudo docker-compose pull
    sudo docker-compose up

For running in detached mode, use the *-d* flag:

.. code-block:: bash

    sudo docker-compose up -d

.. note::
    TEXTA Toolkit's dockerized version comes with a default superuser account:

    **user:** admin

    **password:** 1234

When running, TEXTA Toolkit's GUI should be available at:

* http://localhost

and API at:

* http://localhost/api/v1/

For stopping the services:

.. code-block:: bash

    sudo docker-compose down


Installation for Development
----------------------------

If you want to develop TEXTA Toolkit, want more control over how you run it, or seriously dislike Docker, it is also possible to install Toolkit using Anaconda (or Miniconda as shown in following examples).

Install Miniconda
+++++++++++++++++

First one needs to download and install Miniconda to manage Python environments.
Miniconda is chosen over Anaconda because it's smaller in size, but Toolkit works well with both.

.. code-block:: bash

    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    sh Miniconda3-latest-Linux-x86_64.sh

Also, let's permanently put Conda binaries to **PATH** variable:

.. code-block:: bash

    echo 'export PATH=/path/to/miniconda3/bin:$PATH' >> ~/.bashrc

Clone the Repository
++++++++++++++++++++

Now, let's clone the repository and move to **texta-rest** direcory:

.. code-block:: bash

    git clone https://git.texta.ee/texta/texta-rest
    cd texta-rest

Build the Environment
++++++++++++++++++++++

Now that **environment.yaml** file from the texta-rest repository is present, let's use it to build the environment.
After the environment is built, let's activate it:

.. code-block:: bash

    conda env create -f environment-nogpu.yaml
    conda activate texta-rest
    
.. note::
    If you want Toolkit to use GPU, use environment-gpu.yaml instead.

Migrate & Run Toolkit
++++++++++++++++++++++

After the environment has been created and activated, let's prepare the database:

.. code-block:: bash

    python migrate.py

Running the **migrate.py** script will prepare Django migrations and execute them.
It is necessary to run the script every time the source code changes because Toolkit's data model might have changed as well.
It is also required to run the script before using Toolkit for the first time to create both superuser account and database used to store the data model.

.. note::

    Running **migrate.py** will also create a default superuser account with following credentials which will be printed into the console:

    **user:** admin

    **password:** {{RandomlyGeneratedHexString}} or the value of the environment variable TEXTA_ADMIN_PASSWORD.

    Users can overwrite the username by running **python migrate.py -u {{username}}** instead.
    In cases where the passwords needs to be overwritten, running **python migrate.py -o** will overwrite the password with whatever value is in the environment variable TEXTA_ADMIN_PASSWORD.

Finally let's run the development server:

.. code-block:: bash

    python manage.py runserver

And in another terminal (with same conda environment and in the same folder) run the Celery worker responsible for asynchronous tasks:

.. code-block:: bash

    celery -A toolkit.taskman worker -l info
    
Browsable API
-------------

* http://localhost:8000/api/v1/

TODO

.. _api_reference:

API Reference
-------------

Reference for Toolkit API is available when running the Toolkit:

* http://localhost:8000/api/v1/swagger/

* http://localhost:8000/api/v1/redoc/
