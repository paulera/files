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
