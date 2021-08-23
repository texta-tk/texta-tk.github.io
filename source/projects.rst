`EN <https://docs.texta.ee/projects.html>`_
`ET <https://docs.texta.ee/et/projects.html>`_


.. _project:

########
Projects
########

API reference: http://localhost:8000/api/v1/redoc/#tag/projects

Projects in TEXTA Toolkit are isolated workspaces used to separate resources and access permissions from other users,
this makes sure that a single user or a collective team of users are not overwhelmed with all of the resources that
are available in a single instance of TEXTA Toolkit.
To access any single service, the user will first have to create a Project and define which users have access to it.

Permissions
===========

Depending on the status of every user though, their options for creating a Project differ.
Superusers have the right to create Projects, give access to them from a list of all users available in the
TEXTA Toolkit instance and add/remove indices which are automatically synched from an instance of Elasticsearch.
Whereas normal users can only create Projects but do not have the permissions to make an Elasticsearch index available to the Project.
Normal users have to import datasets into an index through either the Dataset Importer tool or the Document API.

In addition to the superusers and normal users, when creating a Project its authors can assign other users to become its Project Administrator.
Project administrators have the right to add and remove other users access to the Project in addition to removing Elasticsearch indices that are made accessible to the Project.
Alas, normal users who are made a Project Administrator can still not give direct access to an index but can only remove access to them to the Project.

By default, authors of Projects are automatically set as its Project Administrator.

Please note that Project access is universal to all the users part of it, any user inside the Project can create new resources
or delete existing ones. To avoid situations where one users deletes resources created by another user, careful planning and
communication is necessary.

Creating Projects
*****************

GUI
===

Click on the **CREATE** button on the top-left of the front page.
Fill in the title field - this will be the name of your project; select users who should have access to the project and finally choose indices that you are going to work with in the project.

.. note::
    You can select more than one index.

.. note::
    Normal users will need to put in the usernames of individuals they want to give permission to.
    Only superusers can pick them from the list of existing users.

.. _creation_menu:
.. figure:: images/project/create_menu.png

    *Creation menu*


We can see the newly created project in the list on the front page (:numref:`project_list`).

.. _project_list:
.. figure:: images/project/project_list.png

    *Projects list*


API
===

API endpoint: **/projects/**

.. code-block:: bash

    curl -X POST "http://localhost:8000/api/v1/projects/" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
    -d '{
            "title": "Panama Papers (2021)",
            "administrators_write": ["linda"],
            "users_write": ["tauri"],
            "indices_write": ["update_log", "wos_law"]
        }'



Navigate between Projects
*************************
To start working on the project, it needs to be activated first - click on three dots under **Action** column (:numref:`project_actions`) and choose **Use**.
Another way to select a project is from the list on the top-right corner (:numref:`user_projects`). The list will show you all the projects that you are a member of.

.. note::
    Only one project can be activated at a time.

.. _user_projects:
.. figure:: images/project/user_projects.png

    *User projects*


Editing Projects
****************

Details for Projects like the Project title, accessible Indices and Users can be changed on the fly by users
who are superusers or have been added into the Project as its Project Administrator.

GUI
===

On the front page, click on three dots under **Action** column (:numref:`project_actions`) and choose **Edit**.

.. note::
    Only superusers can edit the project.

API
===

API endpoint: **/projects/{project_pk}/**

.. code-block:: bash

    curl -X PATCH "http://localhost:8000/api/v1/projects/10/" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
    -d '{
            "title": "Changed title"
        }'



Deleting Projects
*****************

Deleting Projects will also automatically delete any resources (model files, plot files) that are associated
with the Project. However, any index created through TEXTA Toolkits services will still be kept active inside
Elasticsearch.

Only superusers and Project Administrators have the permissions to delete Projects.

GUI
===

On the front page, click on three dots under **Action** column (:numref:`project_actions`) and choose **Delete**.

.. _project_actions:
.. figure:: images/project/project_actions.png

    *Project actions*

API
===

API endpoint: **/projects/{project_pk}/**

.. code-block:: bash

    curl -X DELETE "http://localhost:8000/api/v1/projects/10/" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049"



Integrating Projects with UAA
*****************************
When using additional UAA functionality, authors of Projects can tie down "scopes" to a Project.
Any user that matches scopes in UAA will have access rights to the Project. However, the degree of the access depends on which additional scopes the user has. Users that come with a "texta.admin" scope are given full superuser rights as described above whereas users with the "texta.project_admin" scope have Project Administrator priviledges to EVERY Project they have been given access to.

For example:

* An user with the following scopes: ["texta.project_admin", "texta.ou", "sputnik_project"]
* First Project with the scope: ["sputnik_project"]
* Second Project with the scope: ["investigative_report"]

In the above example, we have a **normal user** that has Project Administrator rights (Can add/remove users, remove indices, change access scope) to the First Project but can not even see the existance of the Second Project.


API
===

API endpoint: **/projects/**

.. code-block:: bash

    curl -X POST "http://localhost:8000/api/v1/projects/" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
    -d '{
            "title": "Panama Papers (2021)",
            "administrators_write": ["linda"],
            "users_write": ["tauri"],
            "indices_write": ["update_log", "wos_law"],
            "scopes": ["investigative_report"]
        }'
