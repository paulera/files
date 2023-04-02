#!/bin/bash

if [ "$(git status -s)" != "" ]; then

	echo
	printf ${cRed}"There are changes in your "${c0}
	printf ${cYellow}"files"${c0}
	printf ${cRed}" folder!!!!!"${c0}
	echo
	echo
	git status

fi
    
echo
echo "Do you want to proceed and overwrite your current copy?"
echo "Worth to make a backup, maybe?"
echo "(Untracked files won't be deleted)"

read RESULT
if [ "$RESULT" != "yes" ] &&
    [ "$RESULT" != "YES" ] &&
    [ "$RESULT" != "y" ] &&
    [ "$RESULT" != "Y" ]; then
    exit 1
fi

cd "$(dirname "$0")"

echo
printf ${cCyan}"git reset --hard HEAD\n"${c0}
git reset --hard HEAD
echo
printf ${cCyan}"git pull\n"${c0}
git pull
echo

