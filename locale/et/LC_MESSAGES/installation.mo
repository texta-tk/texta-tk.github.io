��    	      d               �      �   d   �      +     :  '   G  �   o  |   
    �  �  �       .   ;     j     z     �  �   �  �   (    �   Configure docker-compose Currently all installation examples for system dependencies are only shown for Debian-based systems. Install Docker Installation Installation Using Docker (recommended) The easiest way to run TEXTA Toolkit is to use prebuilt Docker images from TEXTA registries. For that, one needs to install *Docker* and *docker-compose*: To run :ref:`Elasticsearch <elasticsearch>` in Docker, one needs to increase maximum map count parameter for virtual memory: Users can overwrite the username by running **python migrate.py -u {{username}}** instead. In cases where the passwords needs to be overwritten, running **python migrate.py -o** will overwrite the password with whatever value is in the environment variable TEXTA_ADMIN_PASSWORD. Project-Id-Version: TEXTA Toolkit 2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-07-29 12:30+0300
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: et
Language-Team: et <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 Konfigureeri docker-compose Hetkel on kõik näited tehtud Debiani baasil. Installi Docker Installimine Install Dockeriga Lihtsaim viis TEXTA Toolkiti installimiseks on kasutada Dockeri pilte TEXTA registrist. Selleks tuleb installida *Docker* ja *docker-compose*. Selleks, et edukalt :ref:`Elasticsearchi <elasticsearch>` Dockeris pruukida, tuleb tõsta parameetri *maximum map count* väärtust: Kasutajad saavad loodud admin konto kasutajanime ülekirjutada kasutades hoopis **python migrate.py -u {{kasutajanimi}}. Juhtudel kui on vaja ülekirjutada parooli saab käivitada **python migrate.py -o**, mis asendab parooli keskkonnamuutuja TEXTA_ADMIN_PASSWORD sisuga. 