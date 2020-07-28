#!/bin/sh -l

ls

export BUILD_TARGET_NAME=$1
export SOURCE_ROOT=/github/workspace
echo $SOURCE_ROOT
cd ${BUILD_TARGET_NAME}.Android
bash build.sh