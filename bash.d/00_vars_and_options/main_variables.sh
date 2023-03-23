# ----------------------------------
# Variable: OS = [mac,cygwin,linux]
# ----------------------------------

if [[ "$OSTYPE" =~ "darwin" ]]; then
	export OS="mac"
elif [ "$OSTYPE" == "cygwin" ]; then
	export OS="cygwin"
else
	export OS="linux"
fi

files_debug "Environment: OS=${OS}" "info"


# -------------------------------------
# Variable: HOME = resolved path of ~
# -------------------------------------
if [ -z $HOME ]; then
	export HOME=$(readlink -m ~)
fi

files_debug "Home folder: HOME=${HOME}" "info"

