Tutorial: Using Toolkit via API
===============================

Health of Toolkit
-----------------

For checking the health of a running Toolkit instance, one can access the **/health** endpoint for operating statistics. 
The endpoint responds with information abouth the availability of services (e.g. Elasticsearch and TEXTA MLP) and system resources (e.g. disk, memory, GPU usage, etc.).

.. literalinclude:: files/health.json

Authentication
--------------

* http://localhost/api/v1/rest-auth/registration/

* http://localhost/api/v1/rest-auth/login/

TODO

Browsable API
-------------

* http://localhost/api/v1/

TODO

API Reference
-------------

Reference for Toolkit API is available when running the Toolkit:

* http://localhost/api/v1/swagger/

* http://localhost/api/v1/redoc/
