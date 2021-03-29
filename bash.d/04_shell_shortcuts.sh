function filesfolder() {

	if [ "$2" != "2" ] && [ -d $HOME/$1 ]; then
		cd $HOME/$1;
	elif [ -d $FILESROOT/$1 ]; then
		cd $FILESROOT/$1;
	else
		echo "Caminho para '"$1"' nao encontrado"
		return 1;
	fi

	return 0;

}

# pastas base

function files() { cd $FILESROOT; }
function soft() { filesfolder soft $1; }
function bashd() { filesfolder bash.d $1; }
function bin() { filesfolder bin $1; }

# pastas do dia a dia

if [ -d $HOME/workspace ]; then 
    function work() { cd $HOME/workspace; }
else
    function work() { echo "Directory $HOME/workspace not found to bind the shortcut"; }
fi

if [ -d $HOME/src ]; then 
    function src() { cd $HOME/src; }
else
    function src() { echo "Directory $HOME/src not found to bind the shortcut"; }
fi

function down() { cd $HOME/downloads; }
function desk() { cd $HOME/desktop; }

if [ -d $HOME/images ]; then
    function img() { cd $HOME/images; }
elif [ -d $HOME/pictures ]; then
    function img() { cd $HOME/pictures; }
else
    function img() { echo "Directory $HOME/images or $HOME/pictures not found to bind the shortcut"; }
fi


function doc() { cd $HOME/documents; }
function mp3() { cd $HOME/mp3; }
