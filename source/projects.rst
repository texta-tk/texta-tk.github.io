`EN <https://docs.texta.ee/projects.html>`_
`ET <https://docs.texta.ee/et/projects.html>`_


.. _project:

#########
Projects
#########

API reference: http://localhost:8000/api/v1/redoc/#tag/projects

Create
*******

GUI
====

Before we can start working with the data, we need to create a project.

Click on the **CREATE** button on the top-left of the front page.
Fill in the title field - this will be the name of your project; select users who should have access to the project and finally choose indices that you are going to work with in the project.

.. note::
    You can select more than one index.

We can see the newly created project in the list on the front page (:numref:`project_list`).

.. _project_list:
.. figure:: images/project/project_list.png

    *Projects list*


API
====

API endpoint: **/projects/**

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

Edit
****

GUI
====

On the front page, click on three dots under **Action** column (:numref:`project_actions`) and choose **Edit**.

.. note::
    Only superusers can edit the project.
    
API
====

API endpoint: **/projects/{project_pk}/**

.. code-block:: bash

    curl -X PATCH "http://localhost:8000/api/v1/projects/10/" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
    -d '{
            "title": "Changed title"
        }'

Delete
*******

GUI
====

On the front page, click on three dots under **Action** column (:numref:`project_actions`) and choose **Delete**.

.. _project_actions:
.. figure:: images/project/project_actions.png

    *Project actions*

API
====

API endpoint: **/projects/{project_pk}/**

.. code-block:: bash

    curl -X DELETE "http://localhost:8000/api/v1/projects/10/" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"

Navigate between Projects
**************************
To start working on the project, we need to activate it - click on three dots under **Action** column (:numref:`project_actions`) and choose **Use**.
Another way to select a project is from the list on the top-right corner (:numref:`user_projects`). The list will show you all the projects that you are a member of.

.. note::
    Only one project can be activated at a time.

.. _user_projects:
.. figure:: images/project/user_projects.png

    *User projects*
    
Permissions
***********
Resource sharing and user permissions are handled by two basic principles: user groups and isolated Projects.

There are currently only two user groups, administrators and normal users. Administrators have free access and editing rights to ALL resources
available on a Toolkit instance. Admins are capable of user management (creating/editing/deleting users),
index management (create/delete/open-close Elasticsearch indices) and Project management (creating/deleting/editing index access/assigning users).
On the other end, normal users can only access resources and Elasticsearch data through the use of Projects.

Projects are a way of isolating information and resources from other users. They are exclusively created by Administrators
who then assign which users will have access to the Project and which Elasticsearch indices they are allowed to view.
For any given Toolkit functionality, a user will have to choose a Project they have permissions for and "activate" it. Then
everything they create will be isolated inside the Project and only members of the same Project will have access to it.
Trying to access resources of a Project the user is not part of or the data of an Elasticsearch index the Project has no
rights to will results in a 'Permission Denied' error.

Please note that Project access is universal to all the users part of it, any user inside the Project can create new resources
or delete existing ones. To avoid a situation where one user deletes the necessary resources of another user in the same Project,
careful planning and communication is necessary.
