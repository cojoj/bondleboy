#!/bin/bash

while getopts "p:x:" arg; do
	case $arg in
		p )
			PROJECT_PATH=${OPTARG}
			;;
		x )
			PROJECT_PATH=$XCS_SOURCE_DIR
			;;
	esac
done

cd $PROJECT_PATH

BUILD_SETTINGS_PATH=`xcodebuild -showBuildSettings | grep PRODUCT_SETTINGS_PATH | cut -d'=' -f2`
NAME=`xcodebuild -showBuildSettings | grep -w "PRODUCT_NAME" | cut -d'=' -f2`
BUNDLE_ID=`defaults read $BUILD_SETTINGS_PATH CFBundleIdentifier`
LAST_ELEMENT=${BUNDLE_ID##*.}

if [[ $LAST_ELEMENT =~ \$\(PRODUCT_NAME.*\) ]]; then
	echo ${BUNDLE_ID/$LAST_ELEMENT/$NAME} | sed 's/ //g'
else
	echo $BUNDLE_ID
fi