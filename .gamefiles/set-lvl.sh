#!/bin/bash
THIS_PATH=$( dirname "${BASH_SOURCE[0]}" )

echo $1 > "$THIS_PATH/LVL"

APP=$( ls "$THIS_PATH/remotes/$1" )
cp -R "$THIS_PATH/remotes/$1/$APP" "$THIS_PATH/../git-gud.com/"
