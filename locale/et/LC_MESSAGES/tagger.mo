��    ,      |              �  +   �     	          '  0   C  4   t  �   �  �   a  �     K   
  �   V  z  �  Y   c  I   �  T   	  L   \	  @   �	  =   �	  D   (
  >   m
  D   �
  �   �
     �  -   �       j   %  �   �  M  )  L   w  \   �  
  !  
   ,  d   7  L   �  	   �  K  �     ?  �  F  "   �  H     E   L     �  �   �  �  �  ,        0     @     L     i  .   �  �   �  �   x      H     �   ^  �  �  V   �  f   #  M   �  R   �  F   +  F   r  F   �  F       F   G   �   �      �!  8   �!     �!  �   �!  �   W"  )  �"  N   $  J   k$  V  �$     '  d   '  `   ~'     �'  u  �'     ])  �  d)  )   +  <   I+  8   �+     �+  �   �+   **How do Tagger and Tagger Groups differ?** **description**: **indices**: *Creating Bribe_tag tagger* *Delete* is for deleting the model. Only in GUI. *Edit* is for changing the description. Only in GUI. *List features* lists the word-features and their coefficients that the model used. Works with models that used Count Vectorizer or Tfldf Vectorizer since their output is displayable. *Retrain tagger* retrains the whole tagger model with all the chosen parameters. It's useful in case your dataset changes or you have added some stop words. Only in GUI. *Stop words* is for adding stop words. Stop words are words that the model does not consider while looking for clues of similarities. It is wise to add the most frequent words in the list like *am*, *on*, *in*, *are*. Separate the words with space (' '). *Tag doc* is similar to *Tag text*, except the input is in the JSON format. *Tag random doc* takes a random instance from your dataset, displays it, and returns the result and the probability of this result being correct. *Tag text* is to check how does the model work. If you click on that a window opens. You can paste there some text, choose to lemmatize it (necessary if your model was trained on a lemmatized text), and post it. You then receive the result (True if this text gets the tag and False otherwise) and the probability. Probability shows how confident is your model in its prediction. *The maximum sample size* per class is for limiting the size of data the model trains on. *The negative multiplier* is for changing the ratio of negative examples. :ref:`Tagger <tagger_concept>` operates on saved searches and uses machine learning. :ref:`embedding <embedding_concept>` previously trained on the same dataset. API endpoint **/projects/{project_pk}/taggers/{id}/stop_words/** API endpoint **/projects/{project_pk}/taggers/{id}/tag_doc/** API endpoint **/projects/{project_pk}/taggers/{id}/tag_random_doc/** API endpoint **/projects/{project_pk}/taggers/{id}/tag_text/** API endpoint: **/projects/{project_pk}/taggers/{id}/list_features/** Create a new Tagger model by clicking on the 'CREATE' button in the top-left. Then choose the parameters. After that, all that's left is hitting the "Create"-button (scroll down a bit), seeing the training process and the result of the tagger. Creation Endpoint: **/projects/{project_pk}/taggers/** Example: F1 score is the harmonic mean of these two and should be more informative especially with unbalanced data. Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - read more about them `here <https://scikit-learn.org/stable/modules/feature_extraction.html>`_. In the table view, you can also select several models and delete them all at once by clicking on the dustbin button next to the *CREATE* button in the top-left. If you have several models, you can search for the right one by their description or task status. If you have models on several pages you can change pages in the top-right. LinearSVC might give an error in case there's not enough data in the search. Name of the Tagger model, which is also used as name of the tag while tagging the documents. One model predicts whether a text is positive (True) or negative (False). That is, whether this text gets the label or not. Tagger trains only one model and predicts whether a text is similar to the dataset it was trained on or not. Tagger Group trains several models at once. That means, it can predict several labels at once. Tagger Group trains on :ref:`facts <texta_fact>`. You can have several values under a certain fact and for each value (if it has high enough frequency (*Minimum sample size*) a model is trained. Parameters Precision is the ratio of correctly labeled positives among all instances that got a positive label. Recall is the ratio of correctly labeled positives among all true positives. Response: Searcher's :ref:`query <query_concept>` for the dataset to be trained on. If *Query* is left empty, it will take all data in the active :ref:`project <project_concept>` as an input. You can also use saved searches as your desired input. This input will be the positive examples - later on, the Tagger tags data similar to this one. Tagger The :ref:`fields <field_concept>` the model learns from. If more than one fields is chosen, the fields are concatenated together before the learning process. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to its lemma *eat* and are dealt as one word). The indices the model learns from. The three dots under *Actions* gives you a list of extra actions to use. The trained tagger endpoint: **/projects/{project_pk}/taggers/{id}/** Usage Whenever a new Tagger model is created, you can track its progress from the table under *Task*. If you click on the job, you can see all the training info, how long did it took, and check how successful it was. Let's not forget that: Project-Id-Version: TEXTA Toolkit 2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-12-11 15:15+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: et
Language-Team: et <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 **Kuidas erinevad Tagger ja Tagger Groups?** **description** **indices** *Bribe_tag tagger-i loomine* *Delete* kustutab mudeli. *Edit* on kirjelduse (description) muutmiseks. *List features* väljastab sõnatunnused ja nende koefitsiendid, mida mudel kasutas. Töötab mudelitega, mis kasutasid Count Vectorizer-it või Tfldf Vectorizer-it, kuna nende väljund on kuvatav. *Retrain tagger* treenib kogu Tagger mudeli samade parameetritega uuesti. See on kasulik, kui andmestik muutub või juurde on tulnud uusi stopp-sõnu. *Stop words* on stopp-sõnade lisamiseks. Stopp-sõnad on sõnad, mida mudel ei arvesta, kui ta otsib vihjeid sarnasuste kohta. Arukas on lisada nimekirja kõige sagedasemad sõnad nagu *olema*, *mina*, *sees*, *kõrvalt*. Sõnad tuleb eraldada tühikuga (' '). *Tag doc* on sarnane *Tag text*-ile, ainult et sisend on JSON-formaadis. *Tag random doc* võtab suvalise dokumendi andmestikust, väljastab selle ja tagastab tulemuse ja vastavasse klassi kuulumise tõenäosuse. *Tag text* aitab hõlpsasti kontrollida, kuidas mudel töötab. Sellele vajutades avaneb aken. Aknasse saab kleepida/kirjutada teksti, valida selle lemmatiseerimine (vajalik, kui mudel on treenitud lemmatiseeritud tekstil) ning seejärel see 'postitada' (vajuta *Post*-nuppu). 'Postitamine' väljastab tulemuse (True, kui antud tekst saab vastava täägi, ja False, kui ei saa) ja ennustuse tõenäosuse (probability). Tõenäosus näitab, kui kindel on antud mudel oma ennustuses. *Maksimaalne näidiste hulk* ühe klassi kohta limiteerib treeningandmestiku suurust.  *Negatiivse korrutaja* abil saab muuta negatiivsete näidete suhet positiivsetega treeningandmestikus. :ref:`Tagger <tagger_concept>` kasutab masinõpet ning salvestatud otsinguid. Eelnevalt sama andmestiku peal treenitud :ref:`sõnavektorid <embedding_concept>`. Otspunkt (endpoint): **/projects/{project_pk}/taggers/{id}/tag_text/** Otspunkt (endpoint): **/projects/{project_pk}/taggers/{id}/tag_text/** Otspunkt (endpoint): **/projects/{project_pk}/taggers/{id}/tag_text/** Otspunkt (endpoint): **/projects/{project_pk}/taggers/{id}/tag_text/** Otspunkt (endpoint): **/projects/{project_pk}/taggers/{id}/tag_text/** Uut Tagger mudelit saab luua vajutades üleval vasakul olevat '+CREATE' nuppu. Seejärel vali parameetrid ning vajuta "Create"-nuppu (vajadusel keri natukene all).Nüüd on järele jäänud treeningprotsessi järgmine ja Taggeri tulemuste vaatamine. Loomine Otspunkt (endpoint): **/projects/{project_pk}/taggers/** Näidis: F1-skoor on nende kahe harmooniline keskmine ning peaks olema informatiivsem, eriti just tasakaalust väljas oleva andmestiku puhul. Hashing Vectorizer, Count Vectorizer, Tfldf Vectorizer - loe nende kohta rohkem `siit <https://scikit-learn.org/stable/modules/feature_extraction.html>`_. Tabeli vaates saame valida mitut mudelit korraga ja kustutada need, kasutades prügikasti nupukest *+CREATE* nupukese kõrval üleval vasakul. Mitme mudeli seast saab õiget otsida nende kirjelduse või *task status*-e kaudu. Kui mudeleid on palju, saad vahetada kuvamislehekülge üleval paremal. LinearSVC võib anda errorit, kui salvestatud otsingus on liiga vähe andmeid. Tagger mudeli ja märgendi, millega hakatakse dokumente märgendama, nimi. Üks mudel ennustab, kas tekst on positiivne (True) või negatiivne (False). St, kas tekst saab märgendi või mitte. Tagger treenib vaid ühe mudeli ning ennustab, kas tekst on sarnane sellele andmestikule / salvestatud otsingule, millel see treeniti. Tagger Group treenib mitu mudelit korraga. St, see võib ennustada mitu märgendit korraga. Tagger Group treenib end :ref:`faktide <texta_fact>` põhjal. Meil võib olla mitu erinevat väärtust ühe kindla fakti all ning iga väärtuse kohta (kui sellel väärtusel on piisavalt kõrge sagedus (*Minimum sample size*)) treenitakse eraldi mudel. Parameetrid Precision is the ratio of correctly labeled positives among all instances that got a positive label. Recall ehk saagis on õigesti positiivseks märgendatute ja kõigi positiivsete elementide suhe. Vastus: Searcheri :ref:`otsing <query_concept>` sellele andmestikule, mille peal hakatakse treenima.Tühi *Query* võtab sisendiks kogu andmestiku aktiivses :ref:`projektis <project_concept>`. Soovitud sisendiks võib valida ka salvestatud otsingu. Salvestatud otsing on märgendajale positiivsete näidete kogum - hiljem märgendab mudel sellele otsingukogumile sarnaseid andmeid. Tagger :ref:`Väljad <field_concept>`, mis lähevad mudeli sisendiks. Kui valitakse rohkem kui üks väli, kleepitakse need väljad lihtsalt enne treenimisprotsessi kokku. Ka ühest väljast piisab. Tavaliselt eelistatakse lemmatiseeritud tekste, eritieriti morfoloogiliselt rikaste keelte puhul, kuna see tõstab mõnede sõnade sagedust (*söödud*, *sõi* and *sääb* saavad kõik oma lemmaks vormi *sööma* ja neid käsitletakse ühe sõnana). Indeksid, mille peal mudel õppima hakkab Kolm täpikest *Actions*-i all avab lisategevuste nimekirja. Otspunkt (endpoint): **/projects/{project_pk}/taggers/** Kasutus Iga uue Tagger mudeli progressi saab jälgida tabelis, mis on *Task*-i all. Sellele reale vajutamine kuvab kogu treenimisinfo - kui kaua treenimine aega võttis, kui edukas mudel oli. Meeldetuletusena: 