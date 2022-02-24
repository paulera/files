if [ -f $FILESROOT/dircolors ]; then
	eval "`dircolors -b $FILESROOT/dircolors`"

	# additional variable to set exa tool colours to match the system ones
	export EXA_COLOR=$LS_COLORS
fi
