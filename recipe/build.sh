#!/bin/bash

mkdir -p ${PREFIX}/fonts || true
# flatten by 1: automatic flattening does not always happen due to __MACOSX/* files
mv ubuntu-font-family-${PKG_VERSION}/* . || true
install -v -m644 *.ttf ${PREFIX}/fonts/

# add read file permissions to LICENCE.txt
for folder in "./" "${PREFIX}" "${RECIPE_SRC}"; do
    find ${folder} -name "LICENCE.txt" -exec chmod a+r {} \;
done