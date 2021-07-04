#!/bin/bash

ORG_NAME=$1
APP_NAME=$2

if [[ ! -d git-gud.com ]]; then
    mkdir "git-gud.com"
fi
cd "git-gud.com"
mkdir $ORG_NAME
cd $ORG_NAME
git init --bare "$APP_NAME.git" --quiet >> /dev/null
