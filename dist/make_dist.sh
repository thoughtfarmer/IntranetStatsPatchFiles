#!/usr/bin/env bash

VERSION="1.2.1"
DISTNAME="intranetstatistics"

WORKING_DIR=`dirname $0`
cd $WORKING_DIR

# get the Piwik
rm -rf $DISTNAME
svn export "http://dev.piwik.org/svn/tags/$VERSION" $DISTNAME

# copy files
cp -R plugins/ThoughtFarmer $DISTNAME/plugins
cp -R plugins/ThoughtFarmerUser $DISTNAME/plugins
cp -R images/* $DISTNAME/themes/default/images
cp -R plugins/Login/templates/* $DISTNAME/plugins/Login/templates
cp -R libs/jquery/* $DISTNAME/libs/jquery

# apply patches
cd $DISTNAME
for P in `ls ../patches/*.patch`
do
	patch -p0 < $P
done

# run scripts
php ../scripts/updateTranslation.php

# temporary 1.2.1 patches 
if [ $VERSION = "1.2.1" ]
then
	cp ../patches/1.2.1-core-patches/API.php.TFSTAT-35 plugins/Live/API.php
fi

# build release
cd ..
rm -rf $DISTNAME-$VERSION.tgz
tar -czf $DISTNAME-$VERSION.tgz $DISTNAME
