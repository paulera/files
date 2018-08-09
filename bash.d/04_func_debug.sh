function debug() {

    if [ "$1" == "off" ]; then
        unset XDEBUG_CONFIG
    elif [ "$1" == "status" ]; then
        if [ "$2" == "raw" ]; then
            export | grep XDEBUG_CONFIG | awk '{ print $3; }';
        else
            if [ "$(debug status raw)" == 'XDEBUG_CONFIG="idekey=debugger"' ]; then
                echo "XDebug for CLI is on";
            else
                echo "XDebug for CLI is off";
            fi
        fi
    elif [ "$1" == "on" ]; then
        export XDEBUG_CONFIG="idekey=debugger";
        debug status
    else
        echo "Usage: debug < on | off | status [raw] >"
        echo "Controls the environment variable to allow XDebug remote debug for CLI scripts"
        echo "    on           Turns on the debugger."
        echo "    off          Turns off the debugger."
        echo "    status       Show the stats of the CLI debug"
        echo "    status raw   Echoes the value of the environment variable XDEBUG_CONFIG"
        echo ""
        echo "Current status: $(debug status)"
        echo ""
    fi
}
