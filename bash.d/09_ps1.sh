#!/bin/bash
ID=$(id -u)
ID="_"$ID

if [ "$ID" != "_0" ]; then
	# comum
	export PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \$ \[\e[0m\]";
else
	# root
	export PS1="\[\e[1;31m\]\u@\h \[\e[1;34m\]\w # \[\e[0m\]";
fi
