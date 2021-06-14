#!/bin/bash

THIS_PATH=$( dirname "${BASH_SOURCE[0]}" )
SUBLVL=$1

# load level config: APP_NAME
source "$THIS_PATH/conf.d"

PATH_1="$APP_NAME/" 
PATH_2="$THIS_PATH/$SUBLVL/$APP_NAME/"

if diff -rq -wB -x '.git' $PATH_1 $PATH_2
then
	exit 0
else
	exit 1
fi
