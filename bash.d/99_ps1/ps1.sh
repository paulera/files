#!/bin/bash

#JOBS="if [ ! \$(jobs | wc -l) == 0 ]; then echo \[\e[01\;30m\]\\\[\$(jobs | wc -l)\\\]\\[\e[0m\]\ ; fi"
#ERROR="if [ ! \$? = 0 ]; then echo \[\e[01\;31m\]!\[\e[0m\]; fi;"
#S=""

export GIT_PS1_SHOWDIRTYSTATE=1

__git_ps1_abbreviated() {
    __git_ps1 '(%s) ' | sed -E 's#([^/]{15})[^/]{13,}([^/.]{10})#\1...\2#g'
}

newps() {

    if [ ! -f ~/.files_noemoji ] && [ "${EMOJI}" == "" ]; then
        if [ "$OS" == "cygwin" ]; then
            EMOJIS=(💡 👽 💀 🎃 🙂 👍 🍄 🌻 🌲 🌈 🔥 🥕 🧀 🍔 🍕 🍺 🍷 🏀 🎲 🎯 🚀 💰 💎 💊 🔮 🚽 🎁)
        else
            EMOJIS=(👻 💡 👽 💀 💩 👾 🤖 🎃 🙂 👍 🧢 🐷 🐸 🦄 🦋 🐳 🌵 🍄 🌻 🌲 ⭐️ 🌈 🔥 ⛄️ 🍎 🥕 🥪 🧀 🍔 🍕 🍭 🍰 🍺 ☕️ 🍷 🏀 🚗 🏆 👚 🩳 👑 🐥 🐏 🌺 🌹 🪐 🌎 🍓 🍒 🍿 ⚽️ ⚾️ 🎨 🎸 🎷 🚕 🚙 🚒 🚀 ⏰ 💎 💊 🎁 🪣 🃏 )
        fi
        SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
        export EMOJI="${SELECTED_EMOJI}"
    fi

    ps1_tor() {
        [[ $LD_PRELOAD == *"torsocks/libtorsocks"* ]] && echo "[tor] "
    }

    if [ "$(id -u)" -eq 0 ]; then
		# root
PS1="\
\[${cRed}\]\\u\[${c0}\] \
\[${cCyan}\]@\\h\[${c0}\] \
\[${cBlue}\]\\w\[${c0}\] \
\\$ "
    else

        # common
        if [ "$1" == "local" ]; then
PS1="${EMOJI:+$EMOJI }\
\[${cPurple}\]\$([ \"\$(type -t ps1_tor)\" == \"function\" ] &&  ps1_tor)\[${c0}\]\
\[${cWhite}\]\$([ \"\$(type -t __git_ps1_abbreviated)\" == \"function\" ] &&  __git_ps1_abbreviated)\[${c0}\]\
\[${cBlue}\]\\w\[${c0}\] \
\\$ "
        elif [ "$1" == "wrap" ]; then
PS1="${EMOJI:+$EMOJI }\
\[${cPurple}\]\$([ \"\$(type -t ps1_tor)\" == \"function\" ] &&  ps1_tor)\[${c0}\]\
\[${cGreen}\]\\u\[${c0}\] \
\[${cCyan}\]@$([ -z "$SSH_CONNECTION" ] && echo \\h || echo $SSH_CONNECTION | awk '{ print $3 }')\[${c0}\] \
\[${cWhite}\]\$([ \"\$(type -t __git_ps1_abbreviated)\" == \"function\" ] &&  __git_ps1_abbreviated)\[${c0}\]\
\n\
\[${cWhite}\]┗\[${c0}\] \[${cBlue}\]\\w\[${c0}\] \
\\$ "
        else
PS1="${EMOJI:+$EMOJI }\
\[${cPurple}\]\$([ \"\$(type -t ps1_tor)\" == \"function\" ] &&  ps1_tor)\[${c0}\]\
\[${cGreen}\]\\u\[${c0}\] \
\[${cCyan}\]@$([ -z "$SSH_CONNECTION" ] && echo \\h || echo $SSH_CONNECTION | awk '{ print $3 }')\[${c0}\] \
\[${cWhite}\]\$([ \"\$(type -t __git_ps1_abbreviated)\" == \"function\" ] &&  __git_ps1_abbreviated)\[${c0}\]\
\[${cBlue}\]\\w\[${c0}\] \
\\$ "
        fi

    fi

    export PS1
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
