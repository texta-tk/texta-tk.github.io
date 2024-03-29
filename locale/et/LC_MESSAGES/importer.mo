��          �               L     M      g  B   �  K   �  K     �   c     �  �   �     �     �  %   �     �  7   �  �   0  P   �  :        T  q   �  �  F     �  (   �  6     D   D  M   �  �   �     k	  �   s	  
   "
     -
  %   :
     `
  7   z
  a   �
  Y     J   n  |   �  }   6   *Importing a new dataset* *Navigating to dataset importer* @ is special syntax for reading the binary of the given file name. Browse and choose the file to be uploaded by clicking on the folder button. Click on the **CREATE** button to open up a new form (:numref:`importing`). Click on the **Create** button to start the Importer Task. Upon completion you can add the dataset to your :ref:`project <project_concept>`. Creation Dataset Importer is a tool for uploading **JSON Lines**, **CSV** and **Excel** files into :ref:`Elasticsearch <elasticsearch>` to make them accessible for TEXTA Toolkit. Here you can: Parameters: Set a description for the import task Set the Dataset name Specify a separator for **CSV** files (usually a comma) You can navigate to the Dataset Importer by clicking on the "Dataset Importer" button located under the Tools dropdown menu. (:numref:`importing_loc`). description - Normal description to separate any given task from the other ones. file - File to import (**JSON Lines**, **CSV**, **Excel**) index - Name of the newly created index, please note that Elasticsearch :ref:`index <index_concept>` naming restrictions apply. separator - Only needed for .csv files, defaults to a comma (,). Allows to configure the separator for csv files. Project-Id-Version: TEXTA Toolkit 2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-01-08 16:16+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: et
Language-Team: et <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 *Uue andmestiku importimine* *Dataset Importeri juurde navigeerimine* @ on eriline süntaksimärk binaarse faili lugemiseks. Lehitseda ja valida üleslaaditavaid faile, vajutades kausta nupule. Vajuta **CREATE** nupule, et avada uus importimistöö (:numref:`importing`). Vajuta **Create** nupule importimistöö alustamiseks. Kui importimine on tehtud, saad lisada uue andmestiku oma :ref:`projekti <project_concept>`. Loomine Dataset Importer on tööriist **JSON Lines**, **CSV** ja **Exceli** failide :ref:`Elasticsearchi <elasticsearch>` laadimiseks, et teha need kättesaadavaks TEXTA Toolkitile. Siin saad: Parameetrid: Määrata importimistööle kirjeldus Möörata andmestiku nimi Täpsustada **CSV** failide eraldajat (tavaliselt koma) Dataset Importerit saab valida rippmenüüst Tools > Dataset Importer. (:numref:`importing_loc`). desctiption - Tavaline töö kirjeldus, mille abil eristatakse antud importimistteistest. file - Fail, mida hakatakse importima (**JSON Lines**, **CSV**, **Excel**) index - Vastloodud indeksi nimi. Pane tähele, et sellel kehtivad Elasticsearchi :ref:`index <index_concept>` nimepiirangud. separator - Vajalik vaid .csv failide puhul. Vaikimisi on koma (,). Selle abil saab muuta .csv failide eristajat (separator). 