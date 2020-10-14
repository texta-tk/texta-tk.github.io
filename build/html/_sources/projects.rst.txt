#########
Projects
#########

GUI
===

Create a Project
*******************
Before we can start working with the data, we need to create a project.

Click on the **CREATE** button on the top-left of the front page.
Fill in the title field - this will be the name of your project; select users who should have access to the project and finally choose indices that you are going to work with in the project.

.. note::
    You can select more than one index.

We can see the newly created project in the list on the front page (:numref:`project_list`).

.. _project_list:
.. figure:: images/project/project_list.png

    *Projects list*



Delete a Project
*******************
On the front page, click on three dots under **Action** column (:numref:`project_actions`) and choose **Delete**.

.. _project_actions:
.. figure:: images/project/project_actions.png

    *Project actions*

Edit a Project
*******************
On the front page, click on three dots under **Action** column (:numref:`project_actions`) and choose **Edit**.

Navigate between Projects
**************************
To start working on the project, we need to activate it - click on three dots under **Action** column (:numref:`project_actions`) and choose **Use**.
Another way to select a project is from the list on the top-right corner (:numref:`user_projects`). The list will show you all the projects that you are a memember of.

.. note::
    Only one project can be activated at a time.

.. _user_projects:
.. figure:: images/project/user_projects.png

    *User projects*
    
Permissions
***********
    
Project resources (including indices) are shared among the users with access to the project.

API
====

Create a Project
*******************

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
    

