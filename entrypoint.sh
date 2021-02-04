#!/bin/sh -l

ls

export BUILD_TARGET_NAME=$1
export SOURCE_ROOT=/github/workspace


bash ${BUILD_TARGET_NAME}.Android/build.sh
# error if build fails
RESULT=$?
if [[ $RESULT -ne 0 ]]; then
    echo "Build script returned $RESULT, exiting"
	exit $RESULT
fi


echo "UPLOAD_NAME=Android" >> "$GITHUB_ENV"
echo "UPLOAD_DIR=${BUILD_TARGET_NAME}.Android/libs" >> "$GITHUB_ENV"
