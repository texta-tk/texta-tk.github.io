# Sphinx documentation for TEXTA Toolkit 2

Documentation is built and uploaded automatically to [docs.texta.ee](https://docs.texta.ee/) website.

For testing the documentation locally, use following command to build HTML:

`sphinx-build source public`

If Sphinx not installed:

`apt-get install python3-sphinx`

`apt-get install sphinx-intl`

`pip install sphinx`

How to translate or change things?

**Everyone, who adds something to our docs are required to translate the changes as well.**

Translating:
- Under locale/et/LC_MESSAGES/ you'll find .po files to translate. These files have sentences from the English files. You just have to translate the sentences like so:

```
#: ../../source/api.rst:4
msgid "This is an amazing sentence in English :ref:`API reference <api_reference>`."
msgstr "See on vägev lause eesti keeles :ref:`API reference <api_reference>`."
```

("#, fuzzy" shows that this part was changed and needs to be retranslated)
- save your changes.
- push to git. Currently you can see your changes under 'https://docs.texta.ee/et/' addresses (e.g. +"index.html").

Changing in English version and translating:
- have good writing skills
- our main page is still in English, so you can do your changes in source dir
- refresh your stuff with 
`make gettext` and
`sphinx-intl update -p build/gettext -l en -l et` (this adds the changes you made in English files to the Estonian .po files, but does not delete translations made before in case those were not changed in English. The changed texts are marked with "#, fuzzy")
- translate Estonian with going to locale/et/LC_MESSAGES and adding translations in .po files.
- push it to git

If you want to check your translations or English versions, use:

`sphinx-build -b html -D language=en source public`
and
`sphinx-build -b html -D language=et source public/et`

