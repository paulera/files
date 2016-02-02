#!/bin/bash

JOBS="if [ ! \$(jobs | wc -l) == 0 ]; then echo \[\e[01\;30m\]\\\[\$(jobs | wc -l)\\\]\\[\e[0m\]\ ; fi"
ERROR="if [ ! \$? = 0 ]; then echo \[\e[01\;31m\]!\[\e[0m\]; fi;"

export GIT_PS1_SHOWDIRTYSTATE=1

if [ "_$(id -u)" == "_0" ]; then
	# root
	export PS1="\[\e]0;->\h<- \w\a\]\`$ERROR\`\`$JOBS\`\[\e[1;31m\]\u@\h \[\e[1;37m\]\$(__git_ps1 '(%s) ' )\[\e[1;34m\]\w # \[\e[0m\]";
else
	# common 
	export PS1="\[\e]0;[ \h ] \w\a\]\`$ERROR\`\`$JOBS\`\[\e[1;32m\]\u@\h \[\e[1;37m\]\$(__git_ps1 '(%s) ' )\[\e[1;34m\]\w \$ \[\e[0m\]";
fi
