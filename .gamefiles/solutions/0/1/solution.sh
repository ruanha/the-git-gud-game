#!/bin/bash

ORG_NAME=$1
APP_NAME=$2

if [[ -f "ACompany-app/README.md" ]]; then
    exit 0
fi
exit 1