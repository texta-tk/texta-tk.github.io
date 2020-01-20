.. _installation:

Installation in Docker
======================

.. note::

    Currently all installation examples for system dependencies are only shown for Debian-based systems.

Install Docker
--------------
    
The easiest way to run TEXTA Toolkit is to use our prebuilt Docker images from our registries. For doing so, one needs to install *Docker* and *docker-compose*:

.. code-block:: bash

    sudo apt-get update
    sudo apt-get install docker docker-compose -y

Configure docker-compose
------------------------

We are using *docker-compose* to build an ecosystem of services to support our needs. This is all defined in a file called *docker-compose.yaml*.
To successfully run TEXTA Toolkit we need to define following services:

* Elasticsearch for storing the documents (one can also run it without Docker)

* MySQL for storing user and project data (can also be run without Docker)

* TEXTA Toolkit RESTful API for backend: docker.texta.ee/texta/texta-rest:latest

* TEXTA Toolkit Angular frontend: docker.texta.ee/texta/texta-rest-front:latest

For executing aforementioned services we have preconfigured an example *docker-compose.yaml* file:

.. literalinclude:: files/docker-compose.yaml

The compose file is used in combination with *env* file containing environment variables needed for operating TEXTA Toolkit:

.. literalinclude:: files/env

Run TEXTA Toolkit
-----------------

With the **docker-compose.yaml** and **env** files present and accounted for, 
let's pull the images and start the services by executing the following commands in the same directory with *docker-compose.yaml* and *env*:

.. code-block:: bash

    docker-compose pull
    docker-compose up

For running in detached mode, use the *-d* flag:

.. code-block:: bash

    docker-compose up -d

For stopping the services:

.. code-block:: bash

    docker-compose down


Installation for Development
========================

If you want to develop TEXTA Toolkit, want more control over how you run it, or seriously dislike Docker, it is also possible to install Toolkit using Anaconda (or Miniconda as shown in following examples).

Install Miniconda
------------------

First we need to download and install Miniconda to manage Python environments.
We choose Miniconda over Anaconda because it's smaller in size, but Toolkit works well with both.

.. code-block:: bash

    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    sh Miniconda3-latest-Linux-x86_64.sh

Also, let's put Conda to **PATH** variable:

.. code-block:: bash

    echo 'export PATH=/path/to/miniconda3/bin:$PATH' >> ~/.bashrc

Clone the Repository
--------------------

Now, let's clone the repository and move to **texta-rest** direcory:

.. code-block:: bash

    git clone https://git.texta.ee/texta/texta-rest
    cd texta-rest

Build the Environment
---------------------

Now that we have **environment.yaml** file from the texta-rest repository, let's use it to build the environment.
After the environment is built, let's activate it:

.. code-block:: bash

    conda env create -f environment.yaml
    conda activate texta-rest

Migrate & Run Toolkit
---------------------

After the environment has been created and activated, let's prepare the database:

.. code-block:: bash

    python migrate.py

Finally let's run the development server:

.. code-block:: bash

    python manage.py runserver

And in another terminal run the Celery worker responsible for asynchronous tasks:

.. code-block:: bash

    celery -A toolkit.taskman worker -l info


Checking Toolkit's Health
=========================

For checking the health of a running Toolkit instance, one can access the **/health** endpoint for operating statistics. 
The endpoint responds with information abouth the availability of services (e.g. Elasticsearch and TEXTA MLP) and system resources (e.g. disk, memory, GPU usage, etc.).

.. literalinclude:: files/health.json
