#!/bin/bash
#
# Gathers Sphinx's built HTML files from TEXTA repository and transforms it
# to fit Github Pages' standards. Expects that texta-tk.github.io and
# TEXTA repository reside in the same parent folder, e.g. "Repos".

DOC_PATH=../texta/texta/documentation/sphinx/build/html

echo "Copying files from `realpath $DOC_PATH` to `realpath .`."
cp -R $DOC_PATH/* .

declare -a SOURCE_FOLDERS=("_downloads" "_images" "_sources" "_static")
declare -a DESTINATION_FOLDERS=("downloads" "images" "sources" "static")

NUMBER_OF_FOLDERS=${#SOURCE_FOLDERS[@]}

sleep 2s

echo "Changing folder names to meet Github Pages' needs."

for (( folder_idx=0; folder_idx<${NUMBER_OF_FOLDERS}; folder_idx++ ));
do
	source_folder=${SOURCE_FOLDERS[$folder_idx]}
	destination_folder=${DESTINATION_FOLDERS[$folder_idx]}
	rm -r $destination_folder
	mv $source_folder $destination_folder
	sed -i "s/$source_folder/$destination_folder/g" *.html
done

sleep 2s

echo "Commiting changes to Github."

git add .
git commit -m "Automatic documentation update from TEXTA"
git push
