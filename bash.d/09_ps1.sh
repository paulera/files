#!/bin/bash
ID=$(id -u)
ID="_"$ID


JOBS="if [ ! \$(jobs | wc -l) == 0 ]; then echo \[\e[01\;30m\]\\\[\$(jobs | wc -l)\\\]\\[\e[0m\]\ ; fi"
FACE="if [ ! \$? = 0 ]; then echo \[\e[01\;31m\][!]\[\e[0m\]\ ; fi;"

if [ "$ID" != "_0" ]; then
	# comum
	export PS1="\`$FACE\`\`$JOBS\`\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \$ \[\e[0m\]";
else
	# root
	export PS1="\[\e[1;31m\]\u@\h \[\e[1;34m\]\w # \[\e[0m\]";
fi
