#!/usr/bin/env bash

VERSION="1.11.1"
DISTNAME="intranetstatistics"

WORKING_DIR=`dirname $0`
cd $WORKING_DIR

# get the Piwik
rm -rf $DISTNAME
git clone https://github.com/piwik/piwik.git $DISTNAME
cd $DISTNAME
git checkout $VERSION

# copy files
cp -R ../themes/logo.png ./themes/
cp -R ../themes/logo-header.png ./themes/
mkdir ./tmp/tcpdf

# apply patches
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
