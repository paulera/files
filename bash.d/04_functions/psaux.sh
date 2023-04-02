# TODO: this function needs more love
psaux() {

    if [ "$1" == "--help" ]; then
            printf "Usage: \n\n"
            printf "${cYellow}psaux <grep params>${c0}"
            printf "\n\n     Run the command\n"
            echo     -n "         ps aux | grep "
            printf "${cWhite}<grep params>\n\n${c0}"

            printf "${cYellow}psaux killthat${c0}"
            printf "\n\n     Kill the processes returned by psaux last time\n\n"
 
            return;
    fi

    if [ -z "$1" ]; then
        result=$(ps aux | grep -v grep | grep -v psaux | tail -n +2)
        echo "$result"
    elif [ "$1" == "killthat" ]; then
        pid=$(sed -E 's/^[^0-9]*([0-9]*).*$/\1/g' <(echo "$LAST_PSAUX_RESULT"))
        echo
        echo "PID = ${pid}"
        trimpid=$(echo $pid | tr -d '\040\011\012\015')
        if [ "$trimpid" == "" ]; then
            echo "Nothing to kill."
            return;
        fi
        echo
        printf "${cWhite}Last ${c0}"
        printf "${cYellow}psaux${c0}"
        printf "${cWhite} result:${c0}"
        echo
        echo
        echo "$LAST_PSAUX_RESULT"
        echo "PID=${pid}"
        echo
        echo -n "Are you sure you want to kill "
        printf "${cRed}$pid${c0}"
        echo -n " ? [y/"
        printf "${cWhite}N${c0}"
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
