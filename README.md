# TEXTA Documentation

## About

The repository stores documentation for TEXTA, which is automatically deployed to [Github Pages](https://texta-tk.github.io/) after pushing.

## Updating documentation

#### 1. Make changes to restructured text (.rst) files at sphinx/source/.

#### 2. Convert restructured text documentation project to HTML.

```bash
texta-tk.github.io$ cd sphinx
texta-tk.github.io/sphinx$ make html
```

#### 3. Move built files to root directory, rectify directory structure, change index.html title, and commit.

Among other resources, sphinx's build contains 4 directories with preceding underscore. Those have to be stripped from the underscore and the corresponding changes have to be done in all the HTML files before pushing.

**update_docs.sh takes care of all of that.** 

```bash
texta-tk.github.io/sphinx$ cd ..
texta-tk.github.io$ ./update_docs.sh
```