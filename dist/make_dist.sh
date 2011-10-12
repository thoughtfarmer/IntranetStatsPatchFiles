#!/usr/bin/env bash

VERSION="1.5.1"
DISTNAME="intranetstatistics"

WORKING_DIR=`dirname $0`
cd $WORKING_DIR

# get the Piwik
rm -rf $DISTNAME
svn export "http://dev.piwik.org/svn/tags/$VERSION" $DISTNAME

# copy files
cp -R plugins/ThoughtFarmer $DISTNAME/plugins
cp -R plugins/ThoughtFarmerUser $DISTNAME/plugins
cp -R themes/logo.png $DISTNAME/themes/
cp -R plugins/Login/templates/* $DISTNAME/plugins/Login/templates
cp -R libs/jquery/* $DISTNAME/libs/jquery
cp $DISTNAME/misc/cron/archive.sh $DISTNAME/misc/cron/archive-day-week.sh
cp $DISTNAME/misc/cron/archive.sh $DISTNAME/misc/cron/archive-month-year.sh
rm $DISTNAME/misc/cron/archive.sh

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
