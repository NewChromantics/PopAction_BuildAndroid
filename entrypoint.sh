#!/bin/sh -l

ls

export BUILD_TARGET_NAME=$1
export SOURCEROOT=/github/workspace
echo $SOURCEROOT
cd ${BUILD_TARGET_NAME}.Android
bash build.sh