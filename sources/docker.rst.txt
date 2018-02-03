.. _docker:

Docker
======

TEXTA Toolkit uses `Docker <https://www.docker.com/>`_ containers to set up a working instance without all the installation and operating system related
problems that would otherwise arise. Docker is a more lightweight virtualization solution, which allows to ship preconfigured
applications or whole systems comprising of several services to any Docker supported systems.

Docker is supported on Linux, Windows, and Mac.


Installing Docker
-----------------

Linux
+++++

Docker is widely supported in Linux. For Debian based distributions, e.g Ubuntu, it suffices to run:

.. code-block:: bash

    sudo apt-get update
    sudo apt-get install docker docker-compose -y

Windows
+++++++

Windows has currently three ways to run Docker. The easiest is to create a Ubuntu virtual machine and follow Linux instructions.
For example using `VirtualBox <https://www.virtualbox.org/>`_.
Should this prove to be too crude, there are also 2 other ways to run it, using Docker's native support for the operating system.

`Docker Toolbox <https://docs.docker.com/toolbox/toolbox_install_windows/>`_ is a legacy solution to run Docker on Windows and it relies on VirtualBox.
Despite being legacy, it's still the way to go for many systems, as the recommended alternative needs Windows 10 Professional, Enterprise, or Windows 2016 server.

The recommended, yet somewhat ambitious, alternative is the `Docker for Windows <https://docs.docker.com/docker-for-windows/>`_, which relies on Microsoft's new
native virtualization solution `Hyper-V <https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview>`_
and is allegedly a more efficient way to run virtual machines on Windows. Note, however, that
while Hyper-V is enabled in system settings, other virtual machines will fail.

MacOS
+++++

MacOS docker installation guide can be found from `here <https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-for-mac>`_.


Running TEXTA Toolkit
---------------------

To run TEXTA Toolkit, we must first download the TEXTA Docker images from `DockerHub <http://dockerhub.com/>`_.

In order to do that, navigate to your local TEXTA repository's root directory and go to "docker" child directory.
If you haven't cloned the `TEXTA code <https://github.com/texta-tk/texta>`_ and don't want to, downloading the "docker" directory will suffice as well.

Once inside the "docker" directory, run

.. code-block:: bash

    sudo docker-compose pull

to download the necessary Docker images.

Then run

.. code-block:: bash

    sudo docker-compose up

to actually get TEXTA running.

To stop the container, either press Ctrl+C several times or write

.. code-block:: bash

    sudo docker-compose down

Using TEXTA Toolkit
-------------------

While TEXTA containers are running, TEXTA instance is accessible from `localhost:8000 <http://localhost:8000>`_.
Note that port 8000 has to be available.