#!/bin/bash

#  FatLibraryBuildScript.sh
#  HamsterTools
#
#  Created by Helen McManus on 28/11/2013.
#  Copyright (c) 2013 InvisiblePixels. All rights reserved.

# 386
CONFIG386=Universal-386
CONFIG_BUILD_DIR386=$BUILD_DIR/$CONFIG386
xcodebuild -target HamsterTools -xcconfig $PROJECT_DIR/$PROJECT_NAME/${CONFIG386}.xcconfig  -destination 'platform=iOS Simulator' CONFIGURATION=$CONFIG386 CONFIGURATION_BUILD_DIR=$CONFIG_BUILD_DIR386


# arm
CONFIGarm=Universal-arm
CONFIG_BUILD_DIRarm=$BUILD_DIR/$CONFIGarm
xcodebuild -target HamsterTools -xcconfig $PROJECT_DIR/$PROJECT_NAME/${CONFIGarm}.xcconfig  -destination 'platform=iOS' CONFIGURATION=$CONFIGarm CONFIGURATION_BUILD_DIR=$CONFIG_BUILD_DIRarm


# Now lipo the above two together to get one nice fat juice binary.
SDK_DESTINATION=$PROJECT_DIR/../_SDKs/HamsterToolsSDK
mkdir -p $SDK_DESTINATION
lipo $CONFIG_BUILD_DIR386/libHamsterTools.a  $CONFIG_BUILD_DIRarm/libHamsterTools.a   -create    -output $SDK_DESTINATION/libHamsterTools.a


# Also copy all of the .h files over.
for file in $PROJECT_DIR/HamsterTools/*.h; do
    cp $file $SDK_DESTINATION
done


