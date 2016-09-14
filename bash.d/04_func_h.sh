


#!/bin/bash

# search history

function h() {

	HIGHLIGHT=`echo -e '\033[1;34m'`
	NORMAL=`echo -e '\033[0m'`

    if [ -z $1 ]; then
        echo "Search the commands history"
        echo "Usage: h <search terms>"
    else
       history | grep --color=always $* | sed -e "s/^ \([0-9]\+\)/\n $HIGHLIGHT\1$NORMAL/g"
       echo
       echo -e " \033[1;37mType \033[1;34m!<number>\033[1;37m to recall a command\033[0m"
       echo
    fi
}

