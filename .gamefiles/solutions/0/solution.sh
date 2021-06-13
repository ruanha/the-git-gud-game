#!/bin/bash

THIS_PATH=$( dirname "${BASH_SOURCE[0]}" )
SUBLVL=$1

PATH_1="mock-app-0/" 
PATH_2="$THIS_PATH/$SUBLVL/mock-app-0/"

if diff -rq -wB -x '.git' $PATH_1 $PATH_2
then
	exit 0
else
	exit 1
fi
