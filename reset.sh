#!/bin/bash

LVL=$( < ".gamefiles/LVL" )
SUBLVL=0

# get APP_NAME and ORG_NAME from conf.d
source ".gamefiles/solutions/$LVL/$SUBLVL/conf.d"

# remove local app and the git-gud.com remote
rm -rf "$APP_NAME"
rm -rf "git-gud.com/$ORG_NAME"

# set sublvl back to zero. This includes setting the email
# message and replacing the repo
.gamefiles/set-lvl.sh $LVL
.gamefiles/set-sublvl.sh $SUBLVL

#source .gamefiles/solution/$LVL/$SUBLVL/init.sh 
cd git-gud.com/
mkdir $ORG_NAME
cd $ORG_NAME
git init --bare "$APP_NAME.git" > /dev/null

git clone "$APP_NAME.git" > /dev/null
cd "$APP_NAME"

# init the remote repo
source "../../../.gamefiles/solutions/$LVL/$SUBLVL/init.sh"

rm -rf "$APP_NAME"