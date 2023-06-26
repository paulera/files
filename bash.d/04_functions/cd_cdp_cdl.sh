files_debug "Overriding the command cd (with an alias)"

# Go into a directory using pushd, to maintain navigation history
cd() {
    if [ -z "$1" ]; then
        pushd ~ > /dev/null
    else
        pushd "$*" > /dev/null
    fi
}

# Go back to previous location
cdp() {
    popd &> /dev/null
}

# Directory navigation assistance
# No paramenters: show a list of recent locations
# cdl [0-9]: go to a location listed in `cdl`
cdl() {
    if [[ $1 =~ ^[0-9]+$ ]] ; then
        pushd +$1 &> /dev/null
    else
        echo
        dirs -v -p | tail -n +2
        echo
        read -p "Where to? " DIRNUM
        if [[ $DIRNUM =~ ^[0-9]+$ ]] ; then
            cdl $DIRNUM
        fi
    fi
}

export -f cd
export -f cdp
export -f cdl
