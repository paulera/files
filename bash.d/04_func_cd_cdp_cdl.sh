cd() {
    if [ -z "$1" ]; then
        pushd ~ > /dev/null
    else
        pushd "$*" > /dev/null
    fi
}

cdp() {
    popd &> /dev/null
}

cdl() {
    if [[ $1 =~ ^[0-9]+$ ]] ; then
        pushd +$1 &> /dev/null
    else
        echo
        dirs -v -p | tail -n +2
        echo
    fi
}

