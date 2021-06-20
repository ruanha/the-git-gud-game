#!/bin/bash

function checkLocalRepos {
    THIS_PATH=$( dirname "${BASH_SOURCE[0]}" )
    LVL=$1
    SUBLVL=$2

    # load level config: APP_NAME
    source "$THIS_PATH/solutions/$LVL/$SUBLVL/conf.d"

    PATH_1="$APP_NAME/" 
    PATH_2="$THIS_PATH/solutions/$LVL/$SUBLVL/$ORG_NAME/$APP_NAME/"

    # check if user even has the local repo
    if [[ ! -d "$APP_NAME" ]]; then
        echo "local repo $APP_NAME not found."
        echo "please have the local repo in the game dir"
        echo "like: /the-git-gud-game/$APP_NAME"
        exit 2
    fi
    if diff -rq -wB -x '.git' $PATH_1 $PATH_2
    then
        exit 0
    else
        exit 1
    fi
}