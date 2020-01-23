.. _installation:

Installation
============

Installation Using Docker (recommended)
---------------------------------------

.. note::

    Currently all installation examples for system dependencies are only shown for Debian-based systems.

Install Docker
++++++++++++++
    
The easiest way to run TEXTA Toolkit is to use our prebuilt Docker images from our registries. For doing so, one needs to install *Docker* and *docker-compose*:

.. code-block::

    sudo apt-get update
    sudo apt-get install docker docker-compose -y

To run Elasticsearch in Docker, we need to increase maximum map count parameter for virtual memory:

.. code-block::

    sudo sysctl -w vm.max_map_count=262144

Configure docker-compose
++++++++++++++++++++++++

We are using *docker-compose* to build an ecosystem of services to support our needs. This is all defined in a file called **docker-compose.yaml**.
To successfully run TEXTA Toolkit we need to define following services:

* Elasticsearch for storing the documents (one can also run it without Docker)

* MySQL or Postgres for storing user and project data (can also be run without Docker)

* TEXTA Toolkit RESTful API for backend: docker.texta.ee/texta/texta-rest:latest

* TEXTA Toolkit Angular frontend: docker.texta.ee/texta/texta-rest-front:latest

For executing aforementioned services we have preconfigured an example **docker-compose.yaml** file:

.. literalinclude:: files/docker-compose.yaml

The compose file is used in combination with **env** file containing environment variables needed for operating TEXTA Toolkit:

.. literalinclude:: files/env

Run TEXTA Toolkit
+++++++++++++++++

.. note::

    TEXTA Toolkit's dockerized version comes with a default superuser account:
    
    **user:** admin
    
    **password:** 1234


With the **docker-compose.yaml** and **env** files present and accounted for, 
let's pull the images and start the services by executing the following commands in the same directory with **docker-compose.yaml** and **env**:

.. code-block::

    sudo docker-compose pull
    sudo docker-compose up

For running in detached mode, use the *-d* flag:

.. code-block::

    sudo docker-compose up -d

When running, TEXTA Toolkit's GUI should be available at port 80 and API at port 8000.

For stopping the services:

.. code-block::

    sudo docker-compose down


Installation for Development
----------------------------

If you want to develop TEXTA Toolkit, want more control over how you run it, or seriously dislike Docker, it is also possible to install Toolkit using Anaconda (or Miniconda as shown in following examples).

Install Miniconda
+++++++++++++++++

First we need to download and install Miniconda to manage Python environments.
We choose Miniconda over Anaconda because it's smaller in size, but Toolkit works well with both.

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

Now that we have **environment.yaml** file from the texta-rest repository, let's use it to build the environment.
After the environment is built, let's activate it:

.. code-block:: bash

    conda env create -f environment.yaml
    conda activate texta-rest

Migrate & Run Toolkit
++++++++++++++++++++++

After the environment has been created and activated, let's prepare the database:

.. code-block:: bash

    python migrate.py

Running the **migrate.py** script will prepare Django migrations and execute them.
It is necessary to run the script every time the source code changes because Toolkit's data model might have changed as well.
It is also required to run the script before using Toolkit for the first time to create both superuser account and database used to store the data model.

.. note::

    Running **migrate.py** will also create a default superuser account with following credentials:

    **user:** admin

    **password:** 1234

Finally let's run the development server:

.. code-block:: bash

    python manage.py runserver

And in another terminal run the Celery worker responsible for asynchronous tasks:

.. code-block:: bash

    celery -A toolkit.taskman worker -l info
