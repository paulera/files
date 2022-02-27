#!/bin/bash

#JOBS="if [ ! \$(jobs | wc -l) == 0 ]; then echo \[\e[01\;30m\]\\\[\$(jobs | wc -l)\\\]\\[\e[0m\]\ ; fi"
#ERROR="if [ ! \$? = 0 ]; then echo \[\e[01\;31m\]!\[\e[0m\]; fi;"
#S=""

export GIT_PS1_SHOWDIRTYSTATE=1

newps() {

	c() {
	    echo -n "\\[\e[$1m\\]"
	}

	reset() {
	    echo -n $(c '0')
	}

	red() {
        echo -n $(c '1;31')$1$(c '0')
	}

    green() {
        echo -n $(c '1;32')$1$(c '0')
    }

    blue() {
        echo -n $(c '1;34')$1$(c '0')
    }

    white() {
        echo -n $(c '1;37')$1$(c '0')
    }

    purple() {
        echo -n $(c '0;35')$1$(c '0')
    }

    purpleinv() {
        echo -n $(c '45;30')$1$(c '0')
    }

    ps1_tor() {
        [[ $LD_PRELOAD == *"torsocks/libtorsocks"* ]] && echo "[tor] "
    }

    if [ "$(id -u)" -eq 0 ]; then
		# root
export PS1="\
$(red \\u@\\h) \
$(blue \\w) \
\\$ "
	else
		# common
        if [ "$1" == "local" ]; then
export PS1="\
$(purple "\$(ps1_tor)")\
$(white "\$(__git_ps1 '(%s) ')")\
$(blue \\w) \
\\$ "
        else
export PS1="\
$(purple "\$(ps1_tor)")\
$(green \\u@\\h) \
$(white "\$(__git_ps1 '(%s) ')")\
$(blue \\w) \
\\$ "
        fi
		
	fi
}
newps

# old piece for git status
# $(c '1;37')\$(__git_ps1 '(%s)\\[\e[0m\\] ')$(c '0')\

# working tor bit
# `[[ $LD_PRELOAD == *"torsocks/libtorsocks"* ]] && echo "$(purpleinv \"tor\")$(purple $S) ";`\

#emoji idea - parked
#if [[ "$(uname -s)" == CYGWIN* ]]; then
#	EMOJIS=(💡 👽 💀 🎃 🙂 👍 🍄 🌻 🌲 🌈 🔥 🥕 🧀 🍔 🍕 🍺 🍷 🏀 🎲 🎯 🚀 💰 💎 💊 🔮 🚽 🎁)
#else
#    EMOJIS=(👻 💡 👽 💀 💩 👾 🤖 🎃 🙂 👍 🧢 ☂️ 🐷 🐸 🦄 🦋 🐳 🌵 🍄 🌻 ❄️ ☀️ 🌲 ⭐️ 🌈 🔥 ⛄️ 🍎 🥕 🥪 🧀 🍔 🍕 🍭 🍰 🍺 ☕️ 🍷 🏀 ⚽️ 🎾 🎸 🎲 🎯 🧩 🚗 🛵 🚀 ⛵️ ☎️ 💰 💎 💊 🔮 🧲 🧻 🚽 🎁)
#fi
#SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
