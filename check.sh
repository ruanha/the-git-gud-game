#!/bin/bash
echo "progressing game..."

#if level state files don't exist. initiate them
if [[ ! -f ".gamefiles/LVL" ]]; then
	echo 0 > ".gamefiles/LVL"
	chmod "a+w" ".gamefiles/LVL"
fi
if [[ ! -f ".gamefiles/SUBLVL" ]]; then
	echo 0 > ".gamefiles/SUBLVL" 
	chmod "a+w" ".gamefiles/SUBLVL"
fi

# Load the level state
LVL=$( < ".gamefiles/LVL" )
SUBLVL=$( < ".gamefiles/SUBLVL" )

# execute solution checking file
"./.gamefiles/solutions/$LVL/solution.sh"
return_code=$?

if [ $return_code -eq 0 ]; then
	echo "Your solution is wrong"
	exit 0
fi

# check if there are any more sublevels in the level by
# making a check for a dir named SUBLEVEL+1
# if there are more sublvls
## call increement-sublvl.sh
# else
## call increement-lvl.sh
NEXTSUBLVL=$(( $SUBLVL+1 ))
NEXTSUBLVLDIR=".gamefiles/solutions/$LVL/$NEXTSUBLVL"
if [[ -d "$NEXTSUBLVLDIR" ]]; then
	".gamefiles/increment-sublvl.sh"
else
	".gamefiles/increment-lvl.sh"
fi

exit 0
