#!/bin/bash

".gamefiles/init-lvl.sh"

LVL=0 #$( < ".gamefiles/LVL" )
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

rm -rf "$APP_NAME"