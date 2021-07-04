#!/bin/bash
echo "progressing game..."

".gamefiles/init-lvl.sh"

# Load the level state
LVL=$( < ".gamefiles/LVL" )
SUBLVL=$( < ".gamefiles/SUBLVL" )

# check solution
# load from (sub)levels conf.d file what to check.
# can be either local or remote repos should be equal. Or
# a custom script.
source .gamefiles/solutions/$LVL/$SUBLVL/conf.d

solution_is_correct=true
for item in $CHECKLIST; do
	if [ $item == "local" ]; then
		source .gamefiles/diff-local.sh $LVL $SUBLVL

		if checkLocalRepos $LVL $SUBLVL; then
			echo "local repo is correct"
		else
			echo "local repo is wrong!"
			solution_is_correct=false
		fi
		removeLocalRepos $LVL $SUBLVL $APP_NAME;
	fi
	if [ $item == "remote" ]; then
		echo "MUST CHECK REMOTE"
	fi
	if [ $item == "custom" ]; then
		echo "MUST CHECK CUSTOM SCRIPT"
		source .gamefiles/solutions/$LVL/$SUBLVL/solution.sh $ORG_NAME $APP_NAME
	fi
done

if ! $solution_is_correct; then
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
