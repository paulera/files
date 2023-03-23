# This function is a helper for using the file /tmp/files_that
# Some functions and commands write to /tmp/files_that to allow
# easier use of results to subsequent command. Example:
# `ffa <text-to-search>` will find some files. `vim $(that)` will
# edit the first occurence. `vim $(that 3)` will edit the 3rd 
# occurence if there are many.

function that() {

    [ -f /tmp/files_that ] || return;

    if [ "$1" == "?" ]; then
        cat -n /tmp/files_that
        return;
    fi

    if [ -z "$1" ]; then
        LINE=1;
    else
        LINE=$1;
    fi

    sed -n "${LINE}p" /tmp/files_that;

}
