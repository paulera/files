#!/bin/bash

#JOBS="if [ ! \$(jobs | wc -l) == 0 ]; then echo \[\e[01\;30m\]\\\[\$(jobs | wc -l)\\\]\\[\e[0m\]\ ; fi"
#ERROR="if [ ! \$? = 0 ]; then echo \[\e[01\;31m\]!\[\e[0m\]; fi;"

export GIT_PS1_SHOWDIRTYSTATE=1

newps() {
	
	c() {
	    echo "\\[\e[$1m\\]"
	}
	
	if [ "_$(id -u)" == "_0" ]; then
		# root
export PS1="\
$(c '1;31')\u@\h$(c '0') \
$(c '1;34')\w$(c '0') \
\\$ "
	else
		# common
        if [ "$1" == "local" ]; then
export PS1="\
$(c '1;37')\$(__git_ps1 '(%s)\\[\e[0m\\] ')$(c '0')\
$(c '1;34')\w$(c '0') \
\\$ "
        else
export PS1="\
$(c '1;32')\u@\h$(c '0') \
$(c '1;37')\$(__git_ps1 '(%s)\\[\e[0m\\] ')$(c '0')\
$(c '1;34')\w$(c '0') \
\\$ "
        fi
		
	fi
}
newps

#emoji idea - parked
#if [[ "$(uname -s)" == CYGWIN* ]]; then
#	EMOJIS=(💡 👽 💀 🎃 🙂 👍 🍄 🌻 🌲 🌈 🔥 🥕 🧀 🍔 🍕 🍺 🍷 🏀 🎲 🎯 🚀 💰 💎 💊 🔮 🚽 🎁)
#else
#    EMOJIS=(👻 💡 👽 💀 💩 👾 🤖 🎃 🙂 👍 🧢 ☂️ 🐷 🐸 🦄 🦋 🐳 🌵 🍄 🌻 ❄️ ☀️ 🌲 ⭐️ 🌈 🔥 ⛄️ 🍎 🥕 🥪 🧀 🍔 🍕 🍭 🍰 🍺 ☕️ 🍷 🏀 ⚽️ 🎾 🎸 🎲 🎯 🧩 🚗 🛵 🚀 ⛵️ ☎️ 💰 💎 💊 🔮 🧲 🧻 🚽 🎁)
#fi
#SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
