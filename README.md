# TEXTA Documentation

## About

The repository stores documentation for [TEXTA](https://github.com/texta-tk/texta), which is automatically deployed to [Github Pages](https://texta-tk.github.io/) after pushing.

## Updating documentation

#### 1. Make changes to restructured text (.rst) files at sphinx/source/.

#### 2. Run *update_docs.sh*

*update_docs.sh* performs the following actions:

1. renders HTML from sphinx source code,
2. moves sphinx source code to root directory, so that GitHub Pages could find them,
3. renames directories, so they wouldn't start with underscores, which GitHub Pages can't understand,
4. fixes rendered HTML files due to changes in the directory structure at step 3,
5. changes index.html title (sphinx renders HTML page's title as "\<no title\>" if section tag is missing)
6. pushes the new content to GitHub Pages' TEXTA-TK repository

```bash
texta-tk.github.io$ ./update_docs.sh
```