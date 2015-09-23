psaux() {

	if [ "$1" == "--help" ]; then
		cecho reset "Usage: "
		cecho yellow "psaux <grep params>"
		cecho reset "\n\n     Run the command ps aux | grep "
		cecho white "<grep params>\n\n"
		exit 1;
	fi 

	if [ -z $1 ]; then
		ps aux | grep -v grep | grep -v psaux
	else
		ps aux | grep -v grep | grep -v psaux | grep $*
	fi

}
