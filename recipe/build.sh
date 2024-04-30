#!/bin/bash

set -xe

mkdir -p ${PREFIX}/fonts || true
# flatten by 1: automatic flattening does not always happen due to __MACOSX/* files
mv ubuntu-font-family-${PKG_VERSION}/* . || true
install -v -m644 *.ttf ${PREFIX}/fonts/

pwd
ls -la ${PREFIX}
ls -la ${RECIPE_ROOT}

# add read file permissions to LICENCE.txt
for folder in "./" "${PREFIX}" "${RECIPE_ROOT}" "${SRC_DIR}"; do
    for file in $(find ${folder} -name "LICENCE.txt"); do
        ls -la ${file}
        chmod +r ${file}
        ls -la ${file}
    done
done