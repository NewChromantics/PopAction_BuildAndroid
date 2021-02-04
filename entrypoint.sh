#!/bin/sh -l

ls

# build script used to be ${BUILD_TARGET_NAME}.Android/build.sh
# now specify directly
export BUILD_TARGET_NAME=$1
export BUILD_SCRIPT_PATH=${BUILD_TARGET_NAME}.Android/build.sh
export BUILD_PROJECT_PATH=$2
# https://stackoverflow.com/a/9057392/355753
# gr: this gives "bad substitution"
#export ADDITIONAL_BUILD_ARGUMENTS="${@:3}"
export ADDITIONAL_BUILD_ARGUMENTS=$3

# env vars build.sh is expecting
#BUILD_TARGET_NAME
export SOURCE_ROOT=/github/workspace

if [ ! -f "$BUILD_SCRIPT_PATH" ]; then
    echo "Build Script path ($BUILD_SCRIPT_PATH arg1) file not found"
    exit 1
fi

if [ "$BUILD_PROJECT_PATH" == "" ]; then
	echo "Build project path ($BUILD_PROJECT_PATH argument 2) missing."
	exit 2
fi


bash ${BUILD_SCRIPT_PATH} ${BUILD_PROJECT_PATH} ${ADDITIONAL_BUILD_ARGUMENTS}
# error if build fails
RESULT=$?
if [ $RESULT -ne 0 ]; then
    echo "Build script returned $RESULT, exiting"
	exit $RESULT
fi


echo "UPLOAD_NAME=Android" >> "$GITHUB_ENV"
echo "UPLOAD_DIR=${BUILD_PROJECT_PATH}/libs" >> "$GITHUB_ENV"
