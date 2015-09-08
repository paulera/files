#!/bin/bash

abort_install() {
	echo "Aborted"
	echo ""
	exit 1;
}

confirm_to_proceed() {
	echo -n "Proceed (yes/no)? "
	read RESULT
	if [ "$RESULT" != "yes" ] &&
		[ "$RESULT" != "YES" ] &&
		[ "$RESULT" != "y" ] &&
		[ "$RESULT" != "Y" ]; then
		abort_install
	fi
}

check_variables() {
	
	MSG=""
	
	if [ -z $APPNAME ]; then
		MSG=$MSG"\$APPNAME not defined"
	fi
	
	if [ "$MSG" != "" ]; then
		echo $MSG
		abort_install
	fi
}

check_filesroot() {
	if [ ! -d "$FILESROOT" ]; then
		echo ""
		echo "\$FILESROOT environment variable not defined."
		abort_install
	fi
}

check_soft() {



	if [ ! -d "$FILESROOT/soft" ]; then
		echo "$FILESROOT/soft not found, will create it."
		\mkdir -p $FILESROOT/soft
	fi

	if [ ! -d "$FILESROOT/soft" ]; then
		echo ""
		echo "soft folder expected as $FILESROOT/soft, but not found."
		abort_install
	fi
	
	if [ ! -w "$FILESROOT/soft" ]; then
		echo ""
		echo "You must have write permissions on $FILESROOT/soft"
		abort_install
	fi
}

define_vars() {
	APPFOLDER=$FILESROOT"/soft/"$APPNAME
}

check_already_installed() {
	if [ -d "$APPFOLDER" ]; then
		echo ""
		echo -n "$APPFOLDER already exists. Erase it without undo possibilities (yes/no)?? "
		read RESULT
		if [ "$RESULT" != "yes" ] &&
			[ "$RESULT" != "YES" ] &&
			[ "$RESULT" != "y" ] &&
			[ "$RESULT" != "Y" ]; then
			abort_install
		fi
		
		rm -r -f $APPFOLDER
		
		if [ -d "$APPFOLDER" ]; then
			echo "Tried to erase, but did not worked."
			abort_install
		fi
		
	else
		echo "Not installed yet [OK]"
	fi
}

create_and_go_to_folder() {
	
	if [ -d $APPFOLDER ]; then
		echo "already exists! [ERROR]"
		abort_install
	fi
	
	mkdir -p $APPFOLDER
	
	if [ ! -d $APPFOLDER ]; then
		echo "Could not create. Unknown reason, maybe permissions [ERROR]"
		abort_install
	fi
	
	cd $APPFOLDER
}

link_bin () {
	
	if [ ! -f "$1" ]; then
		echo "link_bin function requires a executable file as first parameter."
		abort_install
	fi
	
	if [ -z "$2" ]; then
		echo "link_bin function requires a link name as second parameter."
		abort_install
	fi
	
	TARGET=$1
	LINKNAME=$FILESROOT"/bin/"$2
	
	if [ -h "$LINKNAME" ]; then
		echo -n "Unlinking $LINKNAME... "
		unlink $LINKNAME
		if [ -h "$LINKNAME" ]; then
			echo "[ERROR]"
			abort_install
		else
			echo "[OK]"
		fi
		
	fi

	echo -n "Creating link: $LINKNAME --> $TARGET ... "
	ln -s $TARGET $LINKNAME
	if [ "$?" == "0" ]; then
		echo "[OK]"
	else
		abort_install
	fi

}

installer_bootstrap() {

	echo -n "Checking \$FILESROOT environment variable... "
	check_filesroot
	echo "$FILESROOT [OK]"
	
	echo -n "Checking for \$FILESROOT/soft folder... "
	check_soft
	echo "Exists and is writable [OK]"

	echo -n "Checking installer configuration... "
	check_variables
	echo "All variables defined [OK]"
	
	define_vars
	
	echo -n "Checking if is already installed... "
	check_already_installed
	
	echo -n "Creating folder $APPFOLDER... "
	create_and_go_to_folder
	echo "[OK]"
	
	echo "Actual folder: $PWD"
	
}
