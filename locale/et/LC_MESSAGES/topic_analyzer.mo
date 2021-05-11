��    %      D              l  )   m  #   �     �  �   �     �     �  Y   �  d   ,  ^   �  )   �  <     ?   W  ;   �  �   �     Y  �  l  a   H  �   �  a   �	  l  �	     Y     `     q  ]  �  L  �  d   /  �   �  0  U     �     �  e   �  �        �     �      �  Z    �  w  !   �  $     "   ?  �   b     2     D  _   Z  \   �  o     +   �  A   �  ;   �  <   1  �   n       z  +  b   �  �   	  C   �    1     Q      Y      k   A  {   /  �!  _   �"  �   M#    &$     ?&     W&  L   k&  �   �&     |'     �'  "   �'  _  �'   **How to choose the number of clusters?** **Interpreting average similarity** **Interpreting document count** *Clustering algorithm* - an algorithm to use for clustering. Minibatchkmeans is a time efficient variant of kmeans with a potential tradeff in quality. *Vectorizer* - a method for creating document vectors. *Clusters view* *Creating a Clustering* *Document limit* - number of documents that will be clustered. Possible maximum is 10000. *Embedding* - if selected then its phraser is used for tokenization. You can leave it empty as well. *Keywords filter* - defines a filter (as a regular expression) for unwanted significant words. *Num cluster* - number of final clusters. *Num dims* - maximum possible dimension of document vectors. *Num topics* - number of dimensions when *Use LSI* is selected. *Stopwords* - custom stopwords to ignore during clustering. *Use LSI* - if selected then high dimensional document-term vectors are reduced into lower dimensional vectors that base on "topics". Add more documents Average similarity is an average cosine similarity between all the documents in the cluster. It ranges between 0 and 1 and higher score indicates that the documents in that cluster are more similar to each other. However, the score has some disadvantages. For example, when a cluster contains 9 documents that are very similar to each other and 10th document is very different from all others, then the score might appear low althought fixing that cluster would be very easy. Choose *fields* on which the clustering is done. The selected fields should contain textual data. Click *View clusters* under Actions. You will see an overwiew about obtained clusters. For each cluster the document count and average cosine similarity between its documents is given as well as a list of significant words. Click on a cluster that is in your interest, this opens you a detailed view of a cluster content. Cluster with significantly larger document count often indicates that the clustering algorithm has failed to separate these documents by the topic. It doesn't necessarily mean that the clustering process in general has been unsuccessful as often it is impossible to cluster all documents perfectly. However, you still might want to take a closer look to such clusters as there may be other reasons for such results as well. For example, the documents in that cluster may contain similar noise or stopwords that makes them artifically similar to each other. Sometimes increasing the number of clusters might help as well. Create Delete documents Delete the cluster General advice would is to better have too many clusters than too few. Think about how many documents you are planning to cluster and choose the number so that the average cluster is small enough to inspect it manually with ease. For example, if you are going to cluster 1000 documents to 50 clusters then average cluster would contain 20 documents. If the cluster contains documents from the same topic it is advisable to tag the documets and delete the cluster. Click on **Tag** button. This operation adds a texta_fact to each of the document in the cluster, with specified name and a string value. **From now on, these documents will be ignored in further clustering processes** It is advisable to delete the cluster after you have tagged it. Click on **Delete** button to do it. It is recommended to use lemmatized or tokenized data. Lemmatization is especially useful with morphologically complex languages. You can tokenize and lemmatize the data with :ref:`MLP <mlp>`. Navigate to **Tools -> Topic Analyzer** and click on the **CREATE** button on top-left. Choose the name for your :ref:`Analyzer <topic_analyzer_concept>` (*Description*). Define the :ref:`query <query_concept>` and select indices on which the :ref:`query <query_concept>` will be executed. If you leave *Query* empty, it will take all documents from the selected indices. If you have any searches defined in your :ref:`project <project_concept>`, they will appear in a dropdown menu if you click on the field *Query* - you can use existing searches as queries. Operations with the cluster Tag documents There exists an API for topic analyzer too, but the magic of the analyzer dissappears when using API. This functionality is useful if some documents in the cluster are from a different topic and you want to remove them - select the documents that you want to remove and click on **trash bin** icon. Topic Analyzer Viewing clusters Viewing documents inside cluster You might want to know whether there exists more documents similar to the ones in the cluster, and if so, add those to the cluster as well, so you could tag them all together. Click on a "More like this" button to query similar documents. In the opened view, select document which you would like to add to the cluster and click on a **+** button. Project-Id-Version: TEXTA Toolkit 2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-05-11 13:19+0300
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: et
Language-Team: et <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 **Kuidas valida klastrite arvu?** **Keskmise sarnasuse tõlgendamine** **Dokumentide arvu tõlgendamine** *Clustering algorithm* - kasutatav klasterdamisalgoritm. Minibatchmeans on kmeans algoritmi ajatõhusam variant, seda potentsiaalselt kvaliteedi arvelt. *Vectorizer* - on meetod dokumendivektorite loomiseks. *Klastrite vaade* *Klasterduse loomine* *Document limit* - klasterdusse minevate dokumentide hulk. Suurim võimalik on 10000 dokumenti. *Embedding* - selle fraasijat kasutatakse tokeniseerimiseks. Selle võib jätta ka tühjaks. *Keywords filter* - defineerib (regulaaravaldisena) filtreid tähenduslikele sõnadele, mida ei soovi kasutada. *Num cluster* - loodavate klastride koguarv *Num dims* - maksimaalne võimalik dokumendivektorite dimensioon. *Num topics* - dimensioonide arv, kui *Use LSI* on valitud. *Stopwords* - klasterdamise ajal ignoreeritavad stoppsõnad. *Use LSI* - kui valitud, siis kõrge dimensioonide arvuga dokument-termini vektorid vähendatakse väiksema dimensioonide arvuga vektoriteks, mis põhinevad "teemadel". Lisa veel dokumente Keskmine sarnasus on keskmine koosinussarnasus klastris kõikide dokumentide vahel. See on vahemikus 0 kuni 1 ning kõrgem skoor viitab suuremale sarnasusele. Sellel skooril on ka puuduseid. Näiteks, kui klastris on 9 dokumenti, mis on üksteisele väga sarnased ning 10 dokument on teistsugune, siis võib skoor tunduda madal, kuigi taolise klastri parandamine on väga kerge. Vali *väljad*, mille peal hakatakse klasterdama. Valitud väljad peaksid sisaldama tekstiandmeid. Klõpsa *View clusters* valikule Action'ite all. Sealt saad ülevaate tekkinud klastritest. Iga klastri kohta on antud dokumentide arv, keskmine dokumentidevaheline koosinussarnasus ning klastrile iseloomulike sõnade nimekiri. Vajuta klastrile, mis pakub huvi. See avab klastrisisu detailvaate. Teistest märkimisväärselt suurema dokumentide arvuga klaster viitab sellele, et klasterdamisalgoritm ei suutnud eristada dokumente teemade kaupa. See ei tähenda ilmtingimata, et klasterdamine polnud edukas, kuna tihti on võimatu klasterdada kõik dokumendid edukalt. Taolisi klastreid tasub siiski hoolikalt uurida - sellel võib olla teisi põhjuseid ka. Näiteks võivad selle klastri dokumendid sisaldada sarnast müra või stoppsõnu, mis teeb neid tehislikult üksteisele sarnasemaks. mõnikord võib aidata ka klastriarvu tõstmine. Loomine Kustuta dokumente Kustuta klaster Üldine soovitus on pigem valida liiga palju klastreid kui liiga vähe. Mõtle, kui palju dokumente plaanid klasterdada ja vali number nii, et keskmine klaster on piisavalt väike hõlpsasti käsitsi kontrollimiseks. Näiteks, kui klasterdad 1000 dokumenti 50 klastrisse, siis keskmises klastris peaks olema 20 dokumenti. Kui klaster sisaldab samateemalisi dokumente, on soovitatav need dokumendid ära märgendada ning klaster kustutada. Klõpsa **Tag** nupule. Selle abil saab lisada texta facti igale dokumendile selles klastris vabalt valitud nime ja väärtusega. **Edaspidi ignoreeritakse neid dokumente klasterdades**. Soovitame kustutada klastri, kui oled selle ära märgendanud. Selleks vajuta **Delete** nuppu. Soovitame kasutada lemmatiseeritud või tokeniseeritud andmestikku. Lemmatiseerimine on eriti kasulik morfoloogiliselt keerukate keelye puhul. Tekstiandmeid saab tokeniseerida ja lemmatiseerida :ref:`MLP <mlp>` abil, Liigu **Tools -> Topic Analyzer** . Klõpsa **CREATE** nuppu ülal vasakul. Vali oma :ref:`Analüsaatorile <topic_analyzer_concept>` (*Description*) nimi. Määra :ref:`päring <query_concept>` ning vali indeksid, millele seda :ref:`päringut <query_concept>` rakendatakse. Kui *Query* on tühi, kasutatakse kõiki dokumente valitud indeksis. Kui antud :ref:`projektis <project_concept>` on eelnevalt salvestatud päringud, ilmuvad need rippmenüüna *Query* väljale klõpsates - nii saad kasutada olemasolevaid otsinguid päringutena. Operatsioonid klastriga Märgenda dokumente Sellel teemaanalüsaatoril on API ka, kuid sellega kaob analüsaatori võlu. See funktsionaalsus on kasulik, kui mõned dokumendid antud klastris on teisest teemast ning on vaja need eemaldada - vali dokumendid, mida soovid eemadlada ning klõpsa **prügikasti** ikoonile. Teemaanalüsaator Klastrite vaatamine Dokumentide vaatamine klastri sees Sa võid tunda huvi, kas andmestikus on veel dokumente, mis on sarnased juba klastris olevatele. Sel juhul saad need dokumendid ka samasse klastrisse lisada, et oleks võimalik neid koos märgendada. Vajuta "More like this" nupule, et pärida sarnaseid dokumente. Avanenud vaates vali dokumente, mida soovid klastrisse lisada ning vajuta **+** nupule. 