#!/usr/bin/env bash

VERSION="1.10.1"
DISTNAME="intranetstatistics"

WORKING_DIR=`dirname $0`
cd $WORKING_DIR

# get the Piwik
rm -rf $DISTNAME
svn export "http://dev.piwik.org/svn/tags/$VERSION" $DISTNAME

# copy files
cp -R themes/logo.png $DISTNAME/themes/
cp -R themes/logo-header.png $DISTNAME/themes/
mkdir $DISTNAME/tmp/tcpdf

# apply patches
cd $DISTNAME
for P in `ls ../patches/*.patch`
do
	patch -p0 < $P
done

# run scripts
php ../scripts/updateTranslation.php

# build release
cd ..
rm -rf $DISTNAME-$VERSION.tgz
tar -czf $DISTNAME-$VERSION.tgz $DISTNAME
