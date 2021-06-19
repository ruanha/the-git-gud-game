#!/bin/bash
source ".gamefiles/diff-local.sh"

if checkLocalRepos $1 $2
then
	exit 0
else
	exit 1
fi