# Various function to jump to common folders

# helper function to navigate to FILES commond folders
# If no param is provided, try to go to a custom user folder if exists,
# otherwise go to FILE's deafaults
# It provided "2" as first param, go straight to FILE's default folders.
function filesfolder() {

	if [ "$2" != "2" ] && [ -d $HOME/$1 ]; then
		cd $HOME/$1;
	elif [ -d $FILESROOT/$1 ]; then
		cd $FILESROOT/$1;
	else
		echo "FILE repo error: Path to $1 not found"
		return 1;
	fi

	return 0;

}

# Shortcuts to main FILES repo resources

function files() { cd $FILESROOT; }
function soft() { filesfolder soft $1; }
function bashd() { filesfolder bash.d $1; }
function bin() { filesfolder bin $1; }

# Shortcuts to user resources (if available)

go_to_user_location() {
    if [ -d $HOME/$1 ]; then 
        cd $HOME/$1;
    else
        echo "User location $HOME/$1 not found";
    fi
}

function work() { go_to_user_location "workspace"; }
function src() { go_to_user_location "src"; }
function down() { go_to_user_location "downloads"; }
function downloads() { go_to_user_location "downloads"; }
function desk() { go_to_user_location "desktop"; }
function desktop() { go_to_user_location "desktop"; }
function img() {
    if [ -d $HOME/images ]; then
        cd $HOME/images;
    elif [ -d $HOME/Images ]; then
        cd $HOME/Images;
    elif [ -d $HOME/pictures ]; then
        cd $HOME/pictures;
    elif [ -d $HOME/Pictures ]; then
        cd $HOME/Pictures;
    elif [ -d $HOME/photos ]; then
        cd $HOME/photos;
    elif [ -d $HOME/Photos ]; then
        cd $HOME/Photos;
    else
        echo "Could not find a location for images diretory";
    fi
}

function doc() { go_to_user_location "documents"; }
function docs() { go_to_user_location "documents"; }
function documents() { go_to_user_location "documents"; }
function mp3() {
    if [ -d $HOME/music/mp3 ]; then
        cd $HOME/music/mp3;
        return;
    fi
    go_to_user_location "mp3";
}
function mus() { go_to_user_location "music"; }
function music() { go_to_user_location "music"; }
function mov() { go_to_user_location "movies"; }
function movies() { go_to_user_location "movies"; }
