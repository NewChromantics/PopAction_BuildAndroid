#!/bin/sh -l

ls

export BUILD_TARGET_NAME=$1
export SOURCE_ROOT=/github/workspace

bash ${BUILD_TARGET_NAME}.Android/build.sh

cp Source/${BUILD_TARGET_NAME}.h ${BUILD_TARGET_NAME}.Android/libs

echo "UPLOAD_NAME=Android" >> "$GITHUB_ENV"
echo "UPLOAD_DIR=${BUILD_TARGET_NAME}.Android/libs" >> "$GITHUB_ENV"
