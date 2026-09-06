__ESC__="\033"

# Resets
export c0="${__ESC__}[0m"
export c0Fg="${__ESC__}[39m"
export c0Bg="${__ESC__}[49m"
export c0Bold="${__ESC__}[22m"
export c0Italic="${__ESC__}[23m"
export c0Under="${__ESC__}[24m"
export c0Blink="${__ESC__}[25m"
export c0Strike="${__ESC__}[29m"

# Foreground
export cBlack="${__ESC__}[22;30m"
export cBlue="${__ESC__}[1;34m"
export cDBlue="${__ESC__}[2;34m"
export cDCyan="${__ESC__}[2;36m"
export cCyan="${__ESC__}[1;36m"
export cDGray="${__ESC__}[2;30m"
export cDGrey="${__ESC__}[2;30m"
export cGray="${__ESC__}[0;37m"
export cGrey="${__ESC__}[0;37m"
export cWhite="${__ESC__}[1;37m"
export cDGreen="${__ESC__}[2;32m"
export cGreen="${__ESC__}[1;32m"
export cDPurple="${__ESC__}[2;35m"
export cPurple="${__ESC__}[1;35m"
export cDRed="${__ESC__}[2;31m"
export cRed="${__ESC__}[1;31m"
export cDYellow="${__ESC__}[2;33m"
export cYellow="${__ESC__}[1;33m"

# Background
export cBgBlack="${__ESC__}[40m"
export cBgRed="${__ESC__}[41m"
export cBgGreen="${__ESC__}[42m"
export cBgYellow="${__ESC__}[43m"
export cBgBlue="${__ESC__}[44m"
export cBgPurple="${__ESC__}[45m"
export cBgCyan="${__ESC__}[46m"
export cBgWhite="${__ESC__}[47m"
export cBgGrey="${__ESC__}[100m"
export cBgGray="${__ESC__}[100m"
export cBgLRed="${__ESC__}[101m"
export cBgLGreen="${__ESC__}[102m"
export cBgLYellow="${__ESC__}[103m"
export cBgLBlue="${__ESC__}[104m"
export cBgLPurple="${__ESC__}[105m"
export cBgLCyan="${__ESC__}[106m"
export cBgLWhite="${__ESC__}[107m"

# Attributes
export cBold="${__ESC__}[1m"
export cItalic="${__ESC__}[3m"
export cUnder="${__ESC__}[4m"
export cBlink="${__ESC__}[5m"
export cStrike="${__ESC__}[9m"


# Combos
export cPurpleInv="${__ESC__}[45;30m"
export cBlackOnPurple="${__ESC__}[45;30m"

unset __ESC__

