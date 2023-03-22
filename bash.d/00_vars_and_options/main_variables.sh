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

# ----------------------------------------------------------
# Variable: FILESROOT = folder where this repo is installed
# ----------------------------------------------------------

export FILESBASHD=$(dirname $(realpath -m $BASH_SOURCE))

files_debug "Main BASH.D: FILESBASHD=${FILESBASHD}" "info"

if [ -d $FILESBASHD ]; then
	export FILESROOT="$(realpath -m $(dirname $FILESBASHD))"
	files_debug "FILES repo root: FILESROOT=${FILESROOT}" "info"
else
	echo "$(basename $BASH_SOURCE): Problem trying to identify the FILES repo root folder."
fi

