if [ "$OS" == "mac" ]; then
    PATH_COREUTILS="/usr/local/opt/coreutils/libexec/gnubin/"
    PATH_COREUTILS_MAC="/opt/homebrew/opt/coreutils/libexec/gnubin/"
    if [ ! -d "${PATH_COREUTILS}" ] && [ ! -d "${PATH_COREUTILS_MAC}" ]; then
        files_debug "Error: missing coreutils on mac environment" "error"
        echo "For the FILES package to work on MacOS environments"
        echo "you must install coreutils"
        echo
        echo "      brew install coreutils"
        echo
        echo "see: https://www.gnu.org/software/coreutils/coreutils.html"
        echo
    else
        files_debug "OK: coreutils is installed in mac environment" "success"
        export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    fi  
else
    files_debug "Nothing to do here"
fi
