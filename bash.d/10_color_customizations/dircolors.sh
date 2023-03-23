if [ -f $FILESROOT/resources/dircolors ]; then
	eval "`dircolors -b $FILESROOT/resources/dircolors`"

	# additional variable to set exa tool colours to match the system ones
	export EXA_COLOR=$LS_COLORS
fi
