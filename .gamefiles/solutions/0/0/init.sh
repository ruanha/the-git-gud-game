#!/bin/bash

THIS_PATH=$( dirname "${BASH_SOURCE[0]}" )

cd $THIS_PATH/../../../../git-gud.com/
mkdir ACompany
cd ACompany
git init --bare ACompany-app.git > /dev/null

#mkdir $THIS_PATH/temp
#cd $THIS_PATH/temp

