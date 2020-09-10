# Sphinx documentation for TEXTA Toolkit 2

Documentation is built and uploaded automatically to [docs.texta.ee](https://docs.texta.ee/) website.

For testing the documentation locally, use following command to build HTML:

`sphinx-build source public`

If Sphinx not installed:

`pip install sphinx`

How to translate or change things?

- have good writing skills
- our main page is still in English, so you can do your changes in source dir
- refresh your stuff with 
`make gettext` and
`sphinx-intl update -p build/gettext -l en -l et` (this adds the changes you made in English files, but does not delete translations made before in case those were not changed)
- translate Estonian with going to locale/et/LC_MESSAGES and adding translations in .po files.
- push it to git
