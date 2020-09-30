#######
Health
#######

One can check the health of a running Toolkit instance - information about the availability of services (e.g. Elasticsearch) and system resources (e.g. disk, memory, GPU usage, etc.)

GUI
****
On the **Projects page** (also Toolkit's home page) we can see technical information about TEXTA Toolkit's server on the right (:numref:`server_status`).

.. _server_status:
.. figure:: images/server_status.png

    *Toolkit Status*
    
    
API
****

The **/health** endpoint is for operating statistics.

.. literalinclude:: files/health.json
