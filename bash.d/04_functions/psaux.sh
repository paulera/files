# TODO: this function needs more love
psaux() {

    if [ "$1" == "--help" ]; then
            cecho reset "Usage: \n\n"
            cecho yellow "psaux <grep params>"
            cecho reset "\n\n     Run the command\n"
            echo     -n "         ps aux | grep "
            cecho white "<grep params>\n\n"

            cecho yellow "psaux killthat"
            cecho reset "\n\n     Kill the processes returned by psaux last time\n\n"
 
            return;
    fi

    if [ -z "$1" ]; then
        result=$(ps aux | grep -v grep | grep -v psaux | tail -n +2)
        echo "$result"
    elif [ "$1" == "killthat" ]; then
        pid=$(echo $(echo "$LAST_PSAUX_RESULT" | awk '{ print $1; }'))
        trimpid=$(echo $pid | tr -d '\040\011\012\015')
        if [ "$trimpid" == "" ]; then
            echo "Nothing to kill."
            return;
        fi
        echo
        cecho white "Last "
        cecho yellow "psaux"
        cecho white " result:"
        echo
        echo
        echo "$LAST_PSAUX_RESULT"
        echo
        echo -n "Are you sure you want to kill "
        cecho red "$pid"
        echo -n " ? [y/"
        cecho white "N"
        echo -n "] "
        read -n1 choice
        if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
            kill -9 $pid
        fi
        echo
    else
        result=$(ps aux | grep -v grep | grep -v psaux | grep $*)
        echo "$result"
    fi

    export LAST_PSAUX_RESULT="$result"




}
