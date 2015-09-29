#!/bin/bash

if [ "$(git status -s)" != "" ]; then

	echo
	cecho red "There are changes in your "
	cecho yellow "files"
	cecho red " folder!!!!!"
	echo
	echo
	git status
	echo
	echo "Do you want to proceed and overwrite changed files?"
	echo "(don't worry about untracked files, they will be fine)"

    read RESULT
    if [ "$RESULT" != "yes" ] &&
        [ "$RESULT" != "YES" ] &&
        [ "$RESULT" != "y" ] &&
        [ "$RESULT" != "Y" ]; then
        exit 1
    fi

	echo
	echo
	cecho white "git reset --hard HEAD\n"
	git reset --hard HEAD
	cecho white "git pull\n"
	git pull
	echo

fi
