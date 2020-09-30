#########
Projects
#########

Creating a Project
*******************

In order to play with the data, we need to create a :ref:`new project <project_concept>`.

GUI
===
We can create a project by clicking the **+ CREATE** button at the bottom of the page.
We can then give it a title, select users who can work on the project and, of course, select datasets (Elasticsearch :ref:`indices <index_concept>`) for the project. 

After the project is created, we can see the new project in the list and can change its datasets and user access via the **Edit** button.


API
====

Endpoint: **/projects/**

Example:

.. code-block:: bash

    curl -X POST "http://localhost:8000/api/v1/projects/" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
    -d '{
            "title": "My project",
            "users": ["http://localhost:8000/api/v1/users/1/"],
            "indices": ["texta_test_index"]
        }'

Using a Project
****************

.. note::
    Only one project can be activated at a time.
    
    Each project can have one or more datasets (Elasticsearch indices).
    
    Project resources are shared among the users with access to the project.
    
GUI
===

In order to work with our project (search info, train taggers) we have to select it from the upper panel next to our username:

.. _figure-5:

.. figure:: images/select_project.png

    Figure 5. *Project Selection*
    
API
===
TODO    

