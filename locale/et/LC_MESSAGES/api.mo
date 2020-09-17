��    '      T              �     �     �     �     �  
   �  :   �       0   .  3   _  A   �  -   �  2     @   6     w  &   �     �  !  �     �  
   �            @        \  L   i  	   �     �     �    �  e  �  �   C	     &
     ?
     U
     h
     �
  P   �
  h   �
  p   [  �  �     M     c     ~  $   �     �  ;   �     �  0     3   G  A   {  -   �  2   �  @        _  1        �  �   �     �     �     �  	   �  <   �     !  m   1     �     �     �  �   �  �  �  �   T     *     B     b     t     �  O   �  z   �  l   v   API Reference Browsable API Create a new project Dataset Importer Embeddings Endpoint **/projects/{project_pk}/taggers/{id}/tag_text/** Endpoint: **/projects/** Endpoint: **/projects/{project_pk}/embeddings/** Endpoint: **/projects/{project_pk}/tagger_groups/** Endpoint: **/projects/{project_pk}/tagger_groups/{id}/tag_text/** Endpoint: **/projects/{project_pk}/taggers/** Endpoint: **/projects/{project_pk}/torchtaggers/** Endpoint: **/projects/{project_pk}/torchtaggers/{id}/tag_text/** Endpoint: **/rest-auth/login/** Endpoint: **/rest-auth/registration/** Example: For checking the health of a running Toolkit instance, one can access the **/health** endpoint for operating statistics. The endpoint responds with information abouth the availability of services (e.g. Elasticsearch and TEXTA MLP) and system resources (e.g. disk, memory, GPU usage, etc.). Health of Toolkit Logging in Parameters: Projects Reference for Toolkit API is available when running the Toolkit: Registration Response is the Token key that you will later need to authenticate requests. Response: Tag text Taggers The purpose of this tutorial is to get you started with using Toolkit API. The tutorial gives you an overview of the most fundamental API operations together with illustrating examples. For more detailed documentations please see :ref:`API reference <api_reference>`. This module allows the user to insert jsonlines, csv and excel files into Elasticsearch to make them accessible by the Toolkit. Please note that this process reads the whole file into the memory and can thus create memory issues when trying to process bigger files, it is advisable to split such files up into smaller chunks and process each one separately. This whole process is asynchronous so the response to the call will be instantaneous and it since it takes a bit time to load the file into the memory, the first 10 seconds might not display any signs of the progress changing. Train a new Torch Tagger Train a new embedding Train a new tagger Train a new tagger group Tutorial: Using Toolkit via API description - Normal description to separate any given task from the other ones. index - Name of the newly created index, please note that Elasticsearch index naming restrictions apply. separator - Only needed for .csv files, defaults to a coma (,). Allows to configure the separator for csv files. Project-Id-Version: TEXTA Toolkit 2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-09-16 15:54+0300
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: et
Language-Team: et <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 API viide (reference) Lehitsetav (browsable) API Loo uus projekt Andmete Importija (Dataset Importer) Sõnavektorid Otspunkt: **/projects/{project_pk}/taggers/{id}/tag_text/** Otspunkt: **/projects/** Otspunkt: **/projects/{project_pk}/embeddings/** Otspunkt: **/projects/{project_pk}/tagger_groups/** Otspunkt: **/projects/{project_pk}/tagger_groups/{id}/tag_text/** Otspunkt: **/projects/{project_pk}/taggers/** Otspunkt: **/projects/{project_pk}/torchtaggers/** Otspunkt: **/projects/{project_pk}/torchtaggers/{id}/tag_text/** Otspunkt: **/rest-auth/login/** Otspunkt (endpoint): **/rest-auth/registration/** Näide: Töötava Toolkiti seisundit saab uurida statistika opereerimise **/health** otspunktis (endpoint). Sealt saab kätte teenuste (e.g. Elasticsearch and TEXTA MLP) ja süsteemi ressursside (nt diski, mälu, GPU kasutus jne) kättesaadavuse info. Toolkiti seisund Sisse logimine Parameetrid: Projektid Viide Toolkiti API-le on kättesaadav, kui Toolkit töötab: Registreerimine Vastus (response) on see Tokeni võti (Token key), mida hiljem tuleb kasutada päringute  autentiseerimiseks. Vastus (response): Märgenda tekst Märgendajad (Taggers) Selle juhendi eesmärk on õpetada, kuidas teha algust TEXTA Toolkiti API-ga. Juhend annab ülevaate kõige põhilistemast API operatsioonidest koos illustreerivate näidetega. Detailsemat dokumentatsiooni näeb :ref:`API viitest <api_reference>`. Selle mooduli abil saab kasutaja sisestada Elasticsearchi jsonlines, csv ja exceli formaadis faile, muutes need niimoodi Toolkitile ligipääsetavaks. Palun pane tähele, et see loeb kogu faili mällu, mis võib põhjustada mäluprobleeme, kui üritatakse üles laadida suuremaid faile. Soovitame taolised suured failid jagada väiksemateks tükkideks ja neid siis eraldi üles laadida. Kogu protsess on asünkroonne. St, päringu vastus võib tulla koheselt, kuid faili mällu laadimine võib võtta natukene rohkem aega. Esimese 10 sekundi jooksul ei pruugi olla näha mingeid muutuseid progressis. Treeni uus Torch Tagger Treeni uus sõnavektorite mudel Treeni uus Tagger Treeni uus Tagger Group Juhend Toolkiti API kasutamine description - Tavaline kirjeldus, mis aitab eristada antud ülesannet teistest. index - Vastloodud indeksi kirjeldus. Palun pane tähele, et sellel kehtivad Elasticsearch-i indeksi nimetamise piirangud. separator - Vajalik vaid .csv failide puhul, vaikimisi on koma (,). Laseb seadistada .csv failide eraldajat. 