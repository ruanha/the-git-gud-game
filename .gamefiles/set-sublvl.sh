#!/bin/bash
THIS_PATH=$( dirname "${BASH_SOURCE[0]}" )
echo $1 > "$THIS_PATH/SUBLVL"

LVL=$( < "$THIS_PATH/LVL" )
SUBLVL=$( < "$THIS_PATH/SUBLVL" )

ln -sf "$THIS_PATH/solutions/$LVL/$SUBLVL/email"

echo "############ EMAIL INBOX ############"
cat "email"
echo "#####################################"
