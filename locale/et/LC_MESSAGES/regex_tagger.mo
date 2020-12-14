��    `                      2     "   P  /   s  "   �     �     �     �  %         &     E     ^      x     �  "   �  #   �     �  &     '   4     \     {     �     �  #   �     �  �   	  �   �	  r  �
  �   '     �  2   �  7   �  A   )  F   k  @   �     �  �   �  ~   �  �       �    �  l  �  �   _  A   �  >   1  W   p  �   �  &   �  }   �  �   a  1   �  �   #  7   �  �   �  �   �  �   �  �   \  �   ?  i   <  4   �  b   �  �   >  @   �  �   )  /   �    �  
   �  �   �  P  �      �!     "  >    "  �   _"  ^   �"  T   J#  \   �#  �   �#  �   �$  #  x%  �   �&  �   ~'  �   G(  �  )  .   �*     +  �   (+  �   �+  q  �,  I   .  �   U.    O/     W0  ]   ]0  (   �0  '   �0  -   1  �  :1  1   �2  %   �2      3  %   43     Z3     i3  2   x3  /   �3  *   �3  +   4     24     E4     a4  2   x4  5   �4  '   �4  '   	5  +   15     ]5     x5     �5  +   �5  $   �5      6  �   %6  �   �6  �  �7  �   ^9     �9  2   �9  7   :  A   S:  F   �:  @   �:     ;  �   %;  �   �;  �   n<    /=  
  A>  �  L?  �   �@  B   mA  L   �A  O   �A  X   MB  9   �B    �B  O   �C  /   CD  �   sD  B   E  �   SE  �   �E  �   �F  �   �G  Y   eH  2   �H  2   �H  =   %I  �   cI  R   J  �   iJ  ,   �J    "K     =L  �   IL  v   M  #   wN  #   �N  Y   �N  �   O  G   �O  =   P  E   FP  �   �P  �   `Q  �   �Q  �   �R  �   �S  �   �T  �  iU  @   �V     ;W  X   MW  �   �W  j  )X  E   �Y  q  �Y  �   L[  
   :\  _   E\  $   �\  $   �\  %   �\   *"Tag Random Doc" collapsing/uncollapsing fields.* *"Tag Random Doc" negative output* *"Tag Random Doc" option in the selection menu* *"Tag Random Doc" positive output* **Option 1**: **Option 2**: *Bulk delete Regex Tagger(s)* *Delete Regex Tagger(s) confirmation* *Delete a single Regex Tagger* *Duplicate Regex Tagger* *Duplicated Regex Tagger* *Edit Regex Tagger modal window* *Edit Regex Tagger* *Empty Regex Tagger creation view* *Filled Regex Tagger creation view* *List of Regex Taggers.* *List of existing Regex Tagger models* *Regex Tagger "Tag Random Doc" window.* *Regex Tagger creation button* *Regex Taggers navigation* *Tag Text modal window* *Tag Text negative output* *Tag Text option in selection menu* *Tag Text positive output* :ref:`Regex Tagger <regex_tagger_concept>` is a tool for tagging texts based on predefined `regular expressions <https://en.wikipedia.org/wiki/Regular_expression>`_ , i.e. regexes. After following all the previously described steps (for either of the two options), the interface should now ask your confirmation for finishing the process (:numref:`regex_tagger_delete_confirmation`). Agree by clicking on the button `"Delete"`. Be careful with using the parameter as end-of-sentence characters are detected naively based on list. This means that the parameter restriction applies even if the detected end-of-sentence character doesn't actually denote the end of a sentence, e.g. each "." is detected as end-of-sentence character in the sentence "George R.R. Martin and J.R.R. Tolkien went fishing". Clicking on the `"Create"` button opens a modal window with text `"New Regex Tagger"` as depicted in :numref:`regex_tagger_new_regex_tagger`. Creation Endpoint **/projects/{project_pk}/regex_taggers/** Endpoint **/projects/{project_pk}/regex_taggers/{id}/** Endpoint **/projects/{project_pk}/regex_taggers/{id}/duplicate/** Endpoint **/projects/{project_pk}/regex_taggers/{id}/tag_random_doc/** Endpoint **/projects/{project_pk}/regex_taggers/{id}/tag_text/** Example: Fill the required :ref:`fields <field_concept>` and click on the `"Create"` button in the bottom right corner of the window (:numref:`regex_tagger_create_view`). For creating a new Regex Tagger model, navigate to `"Models" -> "Regex Taggers"` as seen in :numref:`regex_tagger_navigation`. For deleting a Regex Tagger model through GUI, navigate to `"Models" -> "Regex Taggers"` as seen in :numref:`regex_tagger_navigation`. There are two options for deleting a Regex Tagger model: For duplicating a Regex Tagger model, navigate to `"Models" -> "Regex Taggers"` as seen in :numref:`regex_tagger_navigation`. Select the model you wish to duplicate and navigate to options panel denoted with three vertical dots as seen in :numref:`regex_tagger_list_v2`. For editing a Regex Tagger model, navigate to `"Models" -> "Regex Taggers"` as seen in :numref:`regex_tagger_navigation`. Select the model you wish to edit and navigate to options panel denoted with three vertical dots as seen in :numref:`regex_tagger_list_v2`. For tagging a random document with an existing Regex Tagger model, navigate to `"Models" -> "Regex Taggers"` as seen in :numref:`regex_tagger_navigation`. Select the model you wish to use and navigate to the options panel denoted with three vertical dots. Select the option "Tag Random Doc" from the selection menu as seen in :numref:`regex_tagger_tag_random_doc`. For tagging a text with an existing Regex Tagger model, navigate to `"Models" -> "Regex Taggers"` as seen in :numref:`regex_tagger_navigation`. Function `"Delete"` allows deleting existing Regex Tagger models. Function `"Edit"` allows editing existing Regex Tagger models. Function `"Tag Text"` enables tagging a single text with a selected Regex Tagger model. Function `Duplicate` allows making a copy of an existing Regex Tagger. It is especially useful if you are fine-tuning a specific model but aren't sure that the modifications will actually improve it - just make a copy before you start editing. Has effect only if "operator" = "and". If enabled, ignore end-of-sentence characters between lexicon entry words and/or counter lexicon entries and lexicon entries. If enabled, return the whole alphanumeric string sequence matched, otherwise only the (sub)section exactly matching the original lexicon entry. If set true, ignore case while detecting matches. If the navigation is successful, you should see a panel similar to :numref:`regex_tagger_create_button` with `"Create"` button in the top left corner of the page. Ignored end-of-sentence characters are: [".", "!", "?"] Lexicon entries can either be regular words (e.g. "cat"), phrases (e.g. "black cat"), or regular expressions containing regex wildcard characters(e.g. "\d{2}-\d{2}-\d{4}"). Lexicon entry should appear at the beginning of the word/phrase in the text. Subsequent alphanumeric characters are allowed. E.g. Lexicon entry "cat" matches the words "cat" and "caterpillar", but would not match the word "scattered". Lexicon entry should match a part of the word/phrase in the text. Preceeding and subsequent characters are allowed. E.g. Lexicon entry "cat" matches the words "cat", "caterpillar", and "scattered". Lexicon entry should match the word/phrase in the text exactly. No preceeding or subsequent characters are allowed. E.g. Lexicon entry "cat" matches the word "cat", but would not match the words "caterpillar", and "scattered". List of annulling lexicon entries, which cancel out nearby (see parameter :ref:`counter_slop <param_counter_slop>`) main lexicon matches. Annulling lexicon entries can similarly to main lexicon entries be regular words, phrases, or regular expressions. List of lexicon entries to match (as comma-separated strings in API or newline-separated strings in GUI). Logical operation for matching words in the lexicon. Name of the Regex Tagger model, which is also used as name of the tag while tagging the documents. Number of allowed character changes between lexicon entry and matched string sequence, i.e. `Levenshtein distance <https://en.wikipedia.org/wiki/Levenshtein_distance>`_. Number of non-lexicon words allowed between lexicon entry words. Number of non-lexicon words allowed between main lexion entries and counter lexicon entries for the latter to have annulling effect. One edit is considered as one of the following: PS! The :ref:`fields <field_concept>` in the document not selected by the user and/or not containing any matches are by default collapsed, but you can view their content by clicking on the arrow icon at the end of each field (:numref:`rt_tag_random_doc_other_fields`.) Parameters Regex Tagger is built on `Python's regex module <https://docs.python.org/3/library/re.html>`_ and thus it's important to use the same syntax while constructing your patterns. Required minimum ratio of detected lexicon entries to all the lexicon entries for a positive result. E.g. if we have a lexicon consisting of 4 entries and "required_words" = 1.0, all 4 of these entries must appear in the text for positive outcome; if "required_words" = 0.5, only half of the lexicon entries must appear in the text etc. Response (negative): Response (positive): Return positive result if at least one lexicon entry is found. Return positive result only if all lexicon entries are found (NB! pay attention to :ref:`required_words <param_required_words>` parameter!) Select option "Duplicate" from the selection menu as seen in :numref:`regex_tagger_duplicate`. Select option "Edit" from the selection menu as seen in :numref:`regex_tagger_edit`. Select option "Tag Text" from the selection menu as seen in :numref:`regex_tagger_tag_text`. Select the model you wish to delete by navigating to the options panel denoted with three vertical dots as seen in :numref:`regex_tagger_list_v2` and select option `"Delete"` from the selection menu as seen in :numref:`regex_tagger_delete`. Select the model you wish to use and navigate to options panel denoted with three vertical dots as seen in :numref:`regex_tagger_list_v2`. Select the model(s) you wish to delete by clicking on the selection boxes in front of Regex Tagger model(s) (:numref:`regex_tagger_bulk_delete`). If all the models you wish to delete are selected, click on the red recycle bin icon beside `"Create"` button in the top left corner of the page. Selecting the option instantly triggers the duplication process and the duplicated Regex Tagger model appears in the list of Regex Tagger models with name `"<source_tagger_name>_copy"` (:numref:`regex_tagger_duplicate_list`). Selecting the option opens a new modal window `"Edit Regex Tagger"`. Make your modifications and click on `"Submit"` button in the bottom right corner of the panel (:numref:`regex_tagger_edit_modal`). Selecting the option opens a new modal window `"Tag Text"`. Insert the text you wish to tag and click on the button `"Tag"` in the bottom right corner of the panel (:numref:`regex_tagger_tag_text_modal`). Selecting the option opens a new modal window with the title `"Tag Random Doc"`. Select the index or indices you wish to use from the `"Indices"` selection menu displayed in the window after clicking on the corresponding section and select the :ref:`field(s) <field_concept>` you wish to use from the `"Select Fields"` selection menu below. If finished, click on the button `"Tag"` in the bottom right corner of the panel (:numref:`regex_tagger_tag_random_doc_mw`). Specifies how the lexicon entries are matched. Supported options: The created Regex Tagger can now be seen as the first (or only, if no previous Regex Taggers exist under the project) row in the table of Regex Tagger models (:numref:`regex_taggers_list`). The following section covers all functions supported by Regex Tagger. PS! Some of the functions can only be applied through API as they have no meaningful usage scenarios in GUI. The following section covers everything we need to know about creating Regex Taggers. For getting an overview of the input parameters, see subsection :ref:`Parameters <creation_parameters>`; for creating a Regex Tagger via graphical user interface, see subsection :ref:`GUI <creation_gui>`; for creating a Regex Tagger via API, see subsection :ref:`API <creation_api>`. The following section gives an overview of Regex Tagger input parameters. The results are displayed in the same modal window as seen in :numref:`regex_tagger_tag_random_pos` if any matches were detected. If no matches where found, the text `"No matches found"` is displayed as seen in :numref:`regex_tagger_tag_random_neg`. The results are displayed in the same modal window as seen in :numref:`regex_tagger_tag_text_pos_output` if any matches where detected. If no matches where found, the text `"No matches found"` is displayed as seen in in :numref:`regex_tagger_tag_text_neg_output`. Usage `"Tag Random Doc"` is a helpful function for testing Regex Tagger models on random documents. adding a character, e.g. "cat" -> "catt" missing a character, e.g. "cat" -> "ct" substituting a character, e.g. "cat" -> "kat" Project-Id-Version: TEXTA Toolkit 2
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
 *"Tag Random Doc" väljade avamine ja sulgemine.* *"Tag Random Doc" negatiivne tulemus* *"Tag Random Doc" valikmenüüs* *"Tag Random Doc" positiivne tulemus* **Variant 1**: **Variant 2**: *Mitme Regex Taggeri mudeli samaaegne kustutamine* *Regex Taggeri mudeli(te) kustutamise kinnitus* *Üksiku Regex Taggeri mudeli kustutamine* *Regex Taggeri mudeli duplikaadi tegemine.* *Loodud duplikaat* *Regex Taggeri muutmisaken* *Muuda Regex Taggerit* *Regex Taggeri loomisaken enne väljade täitmist* *Regex Taggeri loomisaken pärast väljade täitmist* *Saadaolevate Regex Taggerite nimekiri* *Saadaolevate Regex Taggerite nimekiri* *"Tag Random Doc" aken enne märgendamist.* *Regex Taggeri loomisnupp* *Navigatsioon Regex Taggerini* *Teksti märgendamise aken* *Tekstist ei tuvastatud ühtegi märgendit* *Teksti märgendamine valikmenüüs* *Tekstist tuvastatud märgendid* :ref:`Regex Tagger <regex_tagger_concept>` on tööriist tekstide mustripõhiseks märgendamiseks `regulaaravaldiste <https://en.wikipedia.org/wiki/Regular_expression>`_ abil. Pärast emma-kumma variandi kõikide eelkirjeldatud sammude läbimist, kuvab kasutajaliides enne mudeli(te) lõplikku kustutamist kinnitusakent. Kustutamise protsessi lõpule viimiseks vajuta nupule `"Delete"`. Ole antud parameetri kasutamisel ettevaatlik, kuna lauselõpumärgid tuvastatakse "naiivselt" nimekirja alusel. See aga tähendab, et parameetri seatud piirang kehtib ka juhul kui tekstist tuvastatud nimekirja kuuluv märk vastavas kontekstis tegelikult lause lõppu ei tähista. Näiteks lauses "George R.R. Martin ja J.R.R. Tolkien läksid kalale", loetakse lauselõpumärkide hulka kõik punktid, olgugi et nad seda tegelikult ei ole. `"Create"` nupu vajutamise järel avaneb hüpikaken tekstiga  `"New Regex Tagger"` (vt. :numref:`regex_tagger_new_regex_tagger`). Loomine Otspunkt **/projects/{project_pk}/regex_taggers/** Otspunkt **/projects/{project_pk}/regex_taggers/{id}/** Otspunkt **/projects/{project_pk}/regex_taggers/{id}/duplicate/** Otspunkt **/projects/{project_pk}/regex_taggers/{id}/tag_random_doc/** Otspunkt **/projects/{project_pk}/regex_taggers/{id}/tag_text/** Näide: Täida nõutud :ref:`väljad <field_concept>`, muuda soovi korral vaikeparameetreid ning vajuta siis "`"Create"` nupule all paremas nurgas (vt. :numref:`regex_tagger_create_view`). Uue Regex Taggeri mudeli loomiseks, navigeeri menüüribal `"Models" -> "Regex Taggers"` nagu kujutatud joonisel :numref:`regex_tagger_navigation`. Regex Taggeri mudeli kustutamiseks, navigeeri menüüribal `"Models" -> "Regex Taggers"` nagu kujutatud joonisel:numref:`regex_tagger_navigation`. Regex Taggeri kustutamiseks on kaks varianti: Regex Taggeri mudelist koopia tegemiseks, navigeeri `"Models" -> "Regex Taggers"` (:numref:`regex_tagger_navigation`). Vali mudel, millest soovid koopia teha ning ava valikute paneel liikudes kolmele vertikaalsele punktile mudelirea lõpus (:numref:`regex_tagger_list_v2`). Regex Taggeri mudeli muutmiseks, navigeeri `"Models" -> "Regex Taggers"` (:numref:`regex_tagger_navigation`). Vali mudel, mida muuta soovid ning ava valikute menüü klikkides kolmele vertikaalsele punktile valitud mudeli rea lõpus (:numref:`regex_tagger_list_v2`). Juhusliku dokumendi märgendamiseks Regex Taggeri mudeliga, navigeeri `"Models" -> "Regex Taggers"` nagu kujutatud joonisel :numref:`regex_tagger_navigation`. Vali mudel, mida märgendamiseks kasutada ning ava vastava mudeli valikmenüü vajutades mudeli rea lõpus olevale kolmele vertikaalsele punktile. Vali avanenud menüüst "Tag Random Doc" nagu kujutatud joonisel :numref:`regex_tagger_tag_random_doc`. Teksti märgendamiseks navigeeri menüüribal `"Models" -> "Regex Taggers"` nagu kujutatud joonisel :numref:`regex_tagger_navigation`. Funktsioon `"Delete"` võimaldab Regex Taggeri mudeleid kustutada. Funktsioon `"Edit"` võimaldab Regex Taggeri mudeleid pärast loomist muuta. Funktsioon `"Tag Text"` võimaldab Regex Taggeri mudeliga teksti märgendamist. Funktsioon `Duplicate` võimaldab eksisteerivast Regex Taggeri mudelist koopia tegemist. Parameetril on mõju üksnes juhul kui "operator" = "and" Lause lõppu tähistavate tähemärkide esinemine leksikonikande sõnade vahel muudab tuvastatud kande kehtetuks; lause lõppu tähistavate tähemärkide esinemine põhileeksikonikande ning annuleeriva leksikonikande vahel, muudab annuleeriva leksikonikande mõju kehtetuks. Aktiveerituna tagastatakse terve sõna/fragment, kust leksikonikanne tuvastati. Aktiveerituna ignoreeritakse tõusutundlikkust. Kui navigatsioon õnnestub, näed joonisega :numref:`regex_tagger_create_button` sarnast paneeli, mille ülemises vasakus nurgas asub nupp nimega `"Create"` Ignoreeritavate lauselõpumärkide hulka kuuluvad: [".", "!", "?"] Leksikonikanded võivad olla tavalised sõna (nt. "kass"), fraasid (nt. "must kass"), või regulaaravaldised (nt. "\d{2}-\d{2}-\d{4}"). Leksikonikanne peab esinema tekstis leiduva sõna/fraasi alguses, kuid sellele võib järgneda ka muid alfabeetilisi tähemärke. Näiteks tuvastatakse leksikonikanne "kass" nii sõnadest "kass" kui ka "kassid", kuid mitte sõnast "karkass". Leksikonikanne peab esinema tekstis leiduvas sõna/fraasis, kuid nii selle ees kui ka järel võib olla ka teisi alfabeetilisi tähemärke.Näiteks tuvastatakse leksikonikanne "kass" nii sõnadest "kass", "kassid" kui ka "karkass". Leksikonikanne peab täielikult ühtima tekstis leiduva sõna/fraasiga. Näiteks tuvastatakse leksikonikanne "kass" sõnast "kass", kuid mitte sõnadest "kassid" ega "karkass" Nimekiri põhileksikonikandeid annulleerivatest sõnadest/fraasidest/regulaaravaldistest. Nimekiri leksikonikannetest, mida tekstist otsida. Loogiline operatsioon leksikonikannete sidumiseks. Regex Taggeri nimi, mida kasutatakse ühtlasi ka märgendina. Lubatud maksimaalne tähemuudatuste arv tekstis leiduva sõna/fragmendi ning leksikonikande vahel (`Levenshteini kaugus <https://en.wikipedia.org/wiki/Levenshtein_distance>`_."). Lubatud maksimaalne leksikoniväliste sõnade arv iga leksikonikande sõnade vahel Lubatud maksimaalne sõnade arv põhileksikonikannete ja annuleerivate leksikonikannete vahel, et annuleerival leksikonikandel mõju oleks. Tähemuudatuseks loetakse ühte järgnevast: PS! Dokumendi :ref:`völjad <field_concept>`, mida kasutaja märgendamiseks ei valinud või kust märgendeid ei leitud, on vaikimisi suletud. Soovi korral on neid võimalik aga avada klikkides nooleikoonil vastava välja sektsiooni lõpus (:numref:`rt_tag_random_doc_other_fields`). Parameetrid Regex Tagger baseerub `Pythoni regexi moodulil <https://docs.python.org/3/library/re.html>`_, mistõttu tuleks mustrite loomisel kasutada samuti Pythoni regulaaravaldiste süntaksit. Nõutud minimaalne leksikonikannete osakaal tekstis. Näiteks, kui meil onneljast sõnast koosnev leksikon ja parameeter "required_words" = 1.0, siis tagastatakse positiivne tulemusüksnes juhul, kui kõik leksikonis leiduvat 4 sõna esinevad ka tekstis; kui aga parameeter "required_words" = 0.5, piisab positiivse tulemuse jaoks üksnes poolte sõnade tekstis esinemisest. Vastus (negatiivse tulemuse korral) Vastus (positiivse tulemuse korral) positiivse tulemuse tagastamiseks peab tekstis leiduma vähemalt üks leksikonikannetest. positiivne tulemust tagastatakse üksnes siis, kui tekstis esinevad kõik leksikonikanded. (NB! vaata ka parameetrit to :ref:`required_words <param_required_words>`!) Vali avanenud menüüst "Duplicate" (:numref:`regex_tagger_duplicate`). Vali avanenud menüüst "Edit" (:numref:`regex_tagger_edit`). Vali avanenud menüüst "Tag Text" (:numref:`regex_tagger_tag_text`). Vali mudel, mida soovid kustutada ning navigeeri kolme vertikaalse punktiga tähistatud valikute paneelile (:numref:`regex_tagger_list_v2`) ning vali avanenud menüüst `"Delete"` (:numref:`regex_tagger_delete`) Vali mudel, mida märgendamiseks kasutada soovid ning ava valikmenüü klikkides kolmele vertikaalsele punktile rea lõpus (:numref:`regex_tagger_list_v2`). Selekteeri kõik mudelid, mida soovid kustutada klikkides kastidele iga Regex Taggeri mudeli ees. (:numref:`regex_tagger_bulk_delete`). Seejärel vajuta punasele prügikasti ikoonile `"Create"` nupu kõrval lehekülje ülemises vasakus nurgas. Nupule vajutamise tagajärjel luuakse valitud Regex Taggeri duplikaat, mis ilmub koheselt ka Regex Taggeri mudelite nimekirja nimega `"<lähtemudeli_nimi>_copy"` (:numref:`regex_tagger_duplicate_list`). Valitud nupule klikkimise tagajärjel avaneb aken kirjaga `"Edit Regex Tagger"`. Tee soovitud muudatused ning vajuta akna alumises paremas nurgas asuvale nupule `"Submit"` (:numref:`regex_tagger_edit_modal`). Valitud nupule klikkimise tagajärjel avaneb uus aken kirjaga `"Tag Text"`. Sisesta tekst, mida soovid märgendada ning vajuta akna alumises paremas nurgas asuvale nupule `"Tag"` (:numref:`regex_tagger_tag_text_modal`). Nupule vajutamise tagajärjel avaneb uus aken pealkirjaga `"Tag Random Doc"`. Vali menüüst pealkirjaga `"Indices"` andmestik(ud), mille seast juhuslik dokument valida  ning menüüst pealkirjaga `"Select Fields"` dokumendi :ref:`väljad <field_concept>`, mida märgendamiseks kasutada. Seejärel vajuta akna alumises paremas nurgas asuvale nupule `"Tag"` (:numref:`regex_tagger_tag_random_doc_mw`). Leksikonikannete teksti sõnadele/fragmentidele sobitamise viis. Toetatud valikud: Loodud Regex Tagger kuvatakse nüüd Regex Taggerite tabeli esimesel (või ainsal) real. Järgnevas sektsioonid kaetakse kõik Regex Taggeri funktsioonid. PS! Teatud funktsioone on võimalik rakendada üksnes läbi API. Järgnev sektsioon katab kõik Regex Taggerite loomisega seonduva.Peatükis :ref:`Parameetrid <creation_parameters>` antakse ülevaade sisendparamteetritest; peatükis :ref:`GUI <creation_gui>` antakse ülevaade Regex Taggerite loomisest graafilise kasutajaliidese kaudu; Peatükis :ref:`API <creation_api>` antakse ülevaade Regex Taggerite loomisest API kaudu. Järgnev peatükk annab ülevaate Regex Taggeri sisendparameetritest. Märgendamise tulemused kuvatakse samas aknas. Joonis :numref:`regex_tagger_tag_random_pos` kujutab positiivset märgendamise tulemust (juhuslikult valitud dokumendist leiti valitud mudeliga märgendid). Joonis :numref:`regex_tagger_tag_random_neg` kujutab negatiivset märgendamise tulemust (juhuslikult valitud dokumendist valitud mudeliga märgendeid ei tuvastatud). Märgendamise tulemused kuvatakse samas aknas (:numref:`regex_tagger_tag_text_pos_output`). Juhul kui tekstist valitud mudeliga märgendeid ei leita, kuvatakse aknas kiri `"No matches found"` (:numref:`regex_tagger_tag_text_neg_output`). Kasutamine Funktsioon "`"Tag Random Doc"` võimaldab märgendada juhusliku dokumendi valitud andmestikust. tähe lisamine nt. "kass" -> "klass" tähe puudumine, nt. "kass" -> "kas" tähe asendamine nt. "kass" -> "gass" 