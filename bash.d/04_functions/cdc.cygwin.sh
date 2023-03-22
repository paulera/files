# cd function for cygwin - go to dir using windows location format
# see: https://cygwin.com/cygwin-ug-net/cygpath.html

if [ "$OS" = "cygwin" ]; then
    files_debug "Declaring function cdc for navigation in Cygwin environment using Windows folder naming"
    cdc() {
        if [ "`command -v cygpath`" == "" ]; then
            echo "Error: cygpath command not found"
            echo "The cdc command is supposed to be used only in cygwin environments."
            echo
            exit 1
        fi	

        cd $(cygpath "$*");
    }
else
    files_debug "Not an CYGWIN environment"
fi
