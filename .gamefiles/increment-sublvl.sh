#!/bin/bash
SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
SUBLVL_PATH="$SCRIPT_DIR/SUBLVL"
SUBLVL=$( < "$SUBLVL_PATH" ) 

"$SCRIPT_DIR/set-sublvl.sh" $(( $SUBLVL + 1 ))

