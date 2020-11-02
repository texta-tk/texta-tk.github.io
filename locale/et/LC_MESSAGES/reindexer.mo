��                                   -     N     i     �  �   �     #  .   ,     [  �   d  s   �  �   [  4   �  w   0  >   �     �  #     *   &  "   Q     t     �  
   �  �   �  X   �  �   �     |  	   �  �   �  �   3	  #   �	  �  

     �  !   �  "   �     �  '     �   .     �  .   �     �  m   �  �   j  �   �  9   �  Y   �  ?   &     f  G   �  B   �          -     M     l    x  T   �  �   �     �     �  �   �  c   �  0   �   *Empty Reindexer creation view* *Filled Reindexer creation view* *List of Reindexer tasks.* *Reindexer creation button* *Reindexer navigation* Clicking on the `"Create"` button opens a new modal window with title `"New Reindexer"` as depicted in :numref:`reindexer_create_new`. Creation Endpoint **/projects/{project_pk}/reindexer/** Example: Fill the required fields and click on the `"Create"` button in the bottom right corner of the window (:numref:`reindexer_create`). For creating a new Reindexing task, navigate to `"Tools" -> "Reindexer"` as seen in :numref:`reindexer_navigation`. If the navigation is successful, you should see a panel similar to :numref:`reindexer_create_button` with `"Create"` button in the top left corner of the page. List of Elasticsearch indices (datasets) to reindex. List of fields to reindex, i.e. transfer to the new index. By default, all the fields in the source index are selected. List of new Elasticsearch field types in the following format: Making a copy of an index; Making a random subset of an index; Making a subset based on predefined query; Merging multiple indices into one; Name of the Reindexing task. Name of the target index. Parameters Random subset size. If defined, new index is constructed of given number of random documents. If left empty, all the documents in the source index (or in accordance with restricted search query) are reindexed. Reference:  `<http://localhost:8000/api/v1/redoc/#operation/projects_reindexer_create>`_ Reindexer is a tool for making copies or subsets of Elasticsearch :ref:`indices <index_concept>`. Reindexer can be used for various data management tasks: Renaming fields; Response: Specified Elasticsearch Search query. If left empty (and `random_size` is not defined), all documents from the source index are transferred to the new one. The created Reindexer can now be seen as the first (or only, if no previous Reindexers exist under the project) row in the table of Reindex tasks (:numref:`reindexer_task_list`). Updating Elasticsearch field types. Project-Id-Version: TEXTA Toolkit 2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-10-27 12:54+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: et
Language-Team: et <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 *Tühi Reindexeri loomisaken* *Täidetud Reindexeri loomisaken* *Reindekseerimisprotsesside tabel* *Reindexeri loomisnupp* *Navigatsioon Reindexeri tööriistani* `"Create"` nupule vajutamise tagajärjel avaneb uus aken pealkirjaga `"New Reindexer"` nagu kujutatud joonisel :numref:`reindexer_create_new`. Loomine Otspunkt **/projects/{project_pk}/reindexer/** Näide: Täida nõutud väljad ja vajuta nupule `"Create"` akna alumises paremas nurgas (:numref:`reindexer_create`). Uue reindekseerimisprotsessi loomiseks navigeeri: `"Tools" -> "Reindexer"` nagu kujutatud joonisel :numref:`reindexer_navigation`. Eduka navigatsiooni korral peaksid nägema joonisega :numref:`reindexer_create_button` analoogset lehte, mille ülemises vasakus nurgas asub nupp nimega `"Create"`. Nimekiri reindekseeritavatest Elasticsearchi indeksitest. Nimekiri uude andmestikku ülekantavatest väljadest. Vaikimisi on valitud kõik väljad. Nimekiri Elasticsearchi väljatüüpidest järgnevas vormingus: Andmestikust koopia loomiseks; Alusandmestikust juhuslikult valitud dokumentidega alamhulga loomiseks; Eeldefineeritud kitsenduste alusel andmestiku alamhulga loomiseks; Mitme andmestiku liitmiseks; Reindekeerimise protsessi nimi. Uue indeksi (andmestiku) nimi. Parameetrid Juhusliku alamhulga suurus. Välja väärtustamisel koostatakse uus indeks (andmestik) valitud arvust juhuslikest dokumentidest. Välja väärtustamata jätmisel kantakse uude andmestikku üle kõik lähteandmestiku (või kitsendatud otsingupäringule `query` vastavad) dokumendid. Viide:  `<http://localhost:8000/api/v1/redoc/#operation/projects_reindexer_create>`_ Reindexer on tööriist Elasticsearchi :ref:`indeksitest <index_concept>` koopiate või alamhulkade loomiseks. Reindexeri on võimalik kasutada järgnevate ülesannete teostamiseks:  Väljade ümbernimetamiseks; Vastus: Eeldefineeritud Elasticsearchi otsingupäring. Välja tühjaks jätmisel (juhul kui `random_size` parameeter on samuti väärtustamata), kantakse uude andmestikku üle kõik lähteandmestiku dokumendid. Loodud Reindexer ilmub nüüd reindekseerimisprotsesside tabelisse (:numref:`reindexer_task_list`). Väljade Elasticsearchi andmetüübi muutmiseks. 