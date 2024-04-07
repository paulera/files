#!/bin/bash

#JOBS="if [ ! \$(jobs | wc -l) == 0 ]; then echo \[\e[01\;30m\]\\\[\$(jobs | wc -l)\\\]\\[\e[0m\]\ ; fi"
#ERROR="if [ ! \$? = 0 ]; then echo \[\e[01\;31m\]!\[\e[0m\]; fi;"
#S=""

export GIT_PS1_SHOWDIRTYSTATE=1

__git_ps1_abbreviated() {
    __git_ps1 '(%s) ' | sed -E 's#([^/]{15})[^/]{13,}([^/.]{10})#\1...\2#g'
}

newps() {

    ps1_tor() {
        [[ $LD_PRELOAD == *"torsocks/libtorsocks"* ]] && echo "[tor] "
    }

    if [ "$(id -u)" -eq 0 ]; then
		# root
export PS1="\
\[${cRed}\]\\u\[${c0}\] \
\[${cCyan}\]@\\h\[${c0}\] \
\[${cBlue}\]\\w\[${c0}\] \
\\$ "
    else
        # common
        if [ "$1" == "local" ]; then
export PS1="\
\[${cPurple}\]\$([ \"\$(type -t ps1_tor)\" == \"function\" ] &&  ps1_tor)\[${c0}\]\
\[${cWhite}\]\$([ \"\$(type -t __git_ps1_abbreviated)\" == \"function\" ] &&  __git_ps1_abbreviated)\[${c0}\]\
\[${cBlue}\]\\w\[${c0}\] \
\\$ "
        else
export PS1="\
\[${cPurple}\]\$([ \"\$(type -t ps1_tor)\" == \"function\" ] &&  ps1_tor)\[${c0}\]\
\[${cGreen}\]\\u\[${c0}\] \
\[${cCyan}\]@\\h\[${c0}\] \
\[${cWhite}\]\$([ \"\$(type -t __git_ps1_abbreviated)\" == \"function\" ] &&  __git_ps1_abbreviated)\[${c0}\]\
\[${cBlue}\]\\w\[${c0}\] \
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
