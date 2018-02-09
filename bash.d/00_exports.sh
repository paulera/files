if [[ "$OSTYPE" =~ "darwin" ]]; then
	export FILES_ENV="mac"
elif [ "$OSTYPE" == "cygwin" ]; then
	export FILES_ENV="cygwin"
else
	export FILES_ENV="linux"
fi

if [ "$FILES_ENV" == "mac" ]; then
	if [ ! -d "/usr/local/opt/coreutils/libexec/gnubin/" ]; then
		echo "For the FILES package to work on MacOS environments"
		echo "you must install coreutils"
		echo
		echo "		brew install coreutils"
		echo
		echo "see: https://www.gnu.org/software/coreutils/coreutils.html"
		echo
	else
		export PATH=/usr/local/opt/coreutils/libexec/gnubin/:$PATH
	fi
fi

export HOME=$(readlink -m ~)

if [ ! -z $BASH_SOURCE ]; then
	#using bash 3 or higher
	FILE=$(readlink -m $BASH_SOURCE)
	BASHDFOLDER=$(dirname $BASH_SOURCE)
else
	FILE=$(readlink -m $0)
	BASHDFOLDER=$(dirname $0)
fi

if [ -d $BASHDFOLDER ]; then
	export FILESROOT="$(dirname $BASHDFOLDER)"
else
	echo "00_exports.sh: Problems with directories structure. Aborted!"
fi

export HISTFILESIZE=9000
