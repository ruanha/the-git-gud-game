#!/bin/bash

# load level config: APP_NAME
source ".gamefiles/solutions/$LVL/$SUBLVL/conf.d"

THIS_PATH=$( dirname "${BASH_SOURCE[0]}" )

PATH_1="$APP_NAME/" 
PATH_2="$THIS_PATH/solutions/$LVL/$SUBLVL/$APP_NAME/"

function createSolutionLocalRepo {
    git clone "git-gud.com/$ORG_NAME/$APP_NAME.git" "$THIS_PATH/solutions/$LVL/$SUBLVL/$APP_NAME" --quiet
    ".gamefiles/solutions/$LVL/$SUBLVL/init-local.sh"
}

createSolutionLocalRepo

function checkLocalRepos {
    LVL=$1
    SUBLVL=$2

    # check if user even has the local repo
    if [[ ! -d "$APP_NAME" ]]; then
        echo "local repo $APP_NAME not found."
        echo "please have the local repo in the game dir"
        echo "like: /the-git-gud-game/$APP_NAME"
        return 2
    fi
    if diff -rq -wB -x '.git' $PATH_1 $PATH_2
    then
        return 0
    else
        return 1
    fi
}

function removeLocalRepos {
    LVL=$1
    SUBLVL=$2
    APP_NAME=$3

    rm -rf ".gamefiles/solutions/$LVL/$SUBLVL/$APP_NAME"
}