#if level state files don't exist. initiate them

if [[ ! -f ".gamefiles/LVL" ]]; then
	echo 0 > ".gamefiles/LVL"
	chmod "a+w" ".gamefiles/LVL"
fi
if [[ ! -f ".gamefiles/SUBLVL" ]]; then
	echo 0 > ".gamefiles/SUBLVL" 
	chmod "a+w" ".gamefiles/SUBLVL"
fi