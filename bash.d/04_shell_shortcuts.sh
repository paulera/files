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

function work() { cd $HOME/workspace; }
function down() { cd $HOME/downloads; }
function desk() { cd $HOME/desktop; }
function img() { cd $HOME/images; }
function doc() { cd $HOME/documents; }
function mp3() { cd $HOME/mp3; }
