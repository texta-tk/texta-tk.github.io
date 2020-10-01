#########
Embedding
#########

:ref:`Embeddings <embedding_concept>` are basically words converted into numerical data (into vectors) that are more understandable and usable for the machine than plain strings (words). With these vectors created, we can compare words and find similar ones. We need embeddings to create, for example, :ref:`lexicons <lexicons>`. Texta Toolkit uses word2vec embeddings with `collocation detection <https://radimrehurek.com/gensim/models/phrases.html>`_. It means that the vectors are created on words and phrases. Phrases are chosen with collocation detection which finds often together occuring words and marks them as phrases. 

GUI
***

We can create a new embedding by clicking on the '+ CREATE' button in the bottom-left. Then we must choose the name for the new embedding (*Description*). If we leave *Query* empty, it will take all data in the active project as a input. We can also use saved searches as our desired input. Then we must choose the fields the embedding learns from. Embedding needs textual data, so we have to choose fields with text or lemmatized text in it. One field is also enough. Usually lemmatized texts are preferred, especially with morphologically complex languages, because it increases the frequency of some words (*eaten*, *eats* and *ate* will change to it's lemma *eat*).

Then we have to choose the number of dimensions. That means the length of the vectors created. 100-200 dimensions is usually a good place to start with. The minimum frequency defines how many times a word or a phrase has to occur in the data in order to get it's very own word/phrase vector. Rare words/phrases won't have very informative and usable vectors. Minimum frequency of 5 can be left as default if we are not sure of what to use.

Keep in mind that the bigger the data, the better results!

After creating the new embedding we can view the learning process and results in the embeddings' table. We can see which user created this embedding in this project, the name of the embedding model, field(s) it was trained on, the time it took to train, dimensions, minimum frequency and created vocabulary size. By clicking on the new model's row we can see similar info again. 

Three dots under *Edit* gives us access to deleting the embedding model or using *Phrase*. *Phrase* is a feature that helps us to check which phrases occur in the embedding model as vectors on their own. It outputs the words and connects phrases with '_'. For example, we can create an embedding model with our saved search 'bribery' (figure 10). If we leave the query empty, the model will be trained on the whole dataset.

.. _figure-12:

.. figure:: images/create_embedding.png

    Figure 12. *Create embedding with saved search*
    
API
***

Endpoint: **/projects/{project_pk}/embeddings/**

Example:

.. code-block:: bash

        curl -X POST "http://localhost:8000/api/v1/projects/11/embeddings/" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Token 8229898dccf960714a9fa22662b214005aa2b049" \
        -d '{
                "description": "My embedding",
                "indices": [{"name": "texta_test_index"}],
                "fields": ["comment_content_lemmas"],
                "num_dimensions": 100,
                "max_documents": 10000,
                "min_freq": 5
            }'
