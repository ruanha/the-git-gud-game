#!/bin/bash
SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
LVL_PATH="$SCRIPT_DIR/LVL"
LVL=$( < "$LVL_PATH" ) 

"$SCRIPT_DIR/set-lvl.sh" $(( $LVL + 1 ))

