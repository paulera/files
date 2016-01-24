# cd function for cygwin

cdc() {
	if [ "`command -v cygpath`" == "" ]; then
		echo "Error: cygpath command not found"
		echo "The cdc command is supposed to be used only in cygwin environments."
		echo
		exit 1
	fi	

	cd $(cygpath "$*");
}

