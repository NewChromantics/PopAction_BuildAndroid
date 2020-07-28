#!/bin/sh -l

ls

export BUILD_TARGET_NAME=$1
export SOURCE_ROOT=/github/workspace

bash ${BUILD_TARGET_NAME}.Android/build.sh

cp Source/${BUILD_TARGET_NAME}.h ${BUILD_TARGET_NAME}.Android/libs

echo "::set-env name=UPLOAD_NAME::Android"
echo "::set-env name=UPLOAD_DIR::${BUILD_TARGET_NAME}.Android/libs"