# autocompletion of files and directories case INsensitive
case "$TERM" in
xterm*|rxvt*)
	bind "set completion-ignore-case on"
    ;;
esac
