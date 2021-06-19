#!/bin/bash

# get APP_NAME from conf.d
LVL=$( < ".gamefiles/LVL" )
SUBLVL=0

source ".gamefiles/solutions/$LVL/$SUBLVL/conf.d"

# remove local app and the git-gud.com remote
rm -rf "$APP_NAME"
rm -rf "git-gud.com/mock-org-0/$APP_NAME.git"

# set sublvl back to zero. This includes setting the email
# message and replacing the repo
.gamefiles/set-lvl.sh $LVL
.gamefiles/set-sublvl.sh $SUBLVL


