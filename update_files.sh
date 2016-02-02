#!/bin/bash

if [ "$(git status -s)" != "" ]; then

	echo
	cecho red "There are changes in your "
	cecho yellow "files"
	cecho red " folder!!!!!"
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
cecho cyan "git reset --hard HEAD\n"
git reset --hard HEAD
echo
cecho cyan "git pull\n"
git pull
echo

