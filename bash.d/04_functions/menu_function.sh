#!/bin/bash

# This script must be sourced, to declare the menu function so it can
# instantiate the variable with the result of the user choice in the
# current session

menu() {
    
    usage() {
        echo "Usage: menu <VARIABLE> <options list>"
        echo
        echo "Prints an interactive menu of options that can be navigated with"
        echo "arrows (up and down) and selected with Enter."
        echo 
        echo "VARIABLE: bash variable that will be set after a selection is made"
        echo "It is an array, where index 0 has the option value and index 1"
        echo "has the option index (starting with 0)."
        echo
        echo "options list: List of quoted strings separated by space"
        echo
        echo "Example (checking if the user chose \"Apple\" from the menu:"
        echo menu MYCHOICE \"Pear\" \"Grapes\" \"Apple\" \"Salad\"
        echo "if [ \"\$MYCHOICE\" == \"Apple\" ]; then ....; fi"
        echo "if [ \"\${MYCHOICE[0]}\" == \"Apple\" ]; then ....; fi"
        echo "if [ \"\${MYCHOICE[1]}\" == \"2\" ]; then ....; fi"
        echo
        echo "(the script that declares this function must be sourced, not called)"
        echo 
    }

    if [ "$1" == "--help" ]; then
        usage
        return
    fi

    # --- Script functions -----------------

    # wait for a key to be pressed and echoes "up", "down" or "enter"
    # TODO: cater for user pressing ESC to cancel the selection. Currently this is done with CTRL+C
    __read_input() {
        read -s -n1 key
        case $key in
            "") echo "enter" ;;
            "A") echo up ;;  # ascii 65
            "B") echo down ;;   # ascii 66
        esac
    }

    # Render the list of options. __set_selection the one indexed by the first
    # parameter (if provided)
    # Usage: render_option [option to __set_selection]
    _reset="\033[0m"
    _cyan="\033[1;36m"
    render_options() {
        _CURRENT_OPTION="" && [ ! -z "$1" ] && _CURRENT_OPTION="$1"
        for (( i=0; i < $COUNT; i++ )); do
            echo -en "\033[K" # erase until end of line to fix glitches
            if [ "$i" == "$_CURRENT_OPTION" ]; then
                echo -ne ${_cyan}"> "
            else
                echo -ne ${_reset}"  "
            fi
            echo -e ${OPTIONS[$i]}"${_reset}"
        done
    }

    # Move the cursor to the begin of the options list and re-render it
    # highlighting the desired option. The option will be assigned to the
    # variables SELECTED_INDEX and SELECTED_VALUE.
    # Usage: __set_selection <option index>
    __set_selection() {
        SELECTED_INDEX=$1
        SELECTED_VALUE=${OPTIONS[$SELECTED_INDEX]}
        
        # Moves the cursor $COUNT lines up, to re-render the menu
        echo -en "\033[${COUNT}A"

        render_options $1
    }

    # --- Script entry point -----------------

    VARIABLE_TO_WRITE=$1
    shift
    OPTIONS=( "$@" )
    COUNT=${#OPTIONS[@]}
    SELECTED_INDEX=0
    SELECTED_VALUE=${OPTIONS[$SELECTED_INDEX]}
    STATE="first" # menu selection state: first, last, middle
    render_options 0

    while true; do
        
        # wait for a key to be pressed
        key=$(__read_input)

        # The ENTER and ESC keys are interruption - doesn't depend on state.
        if [ "$key" == "enter" ]; then break; fi
        if [ "$key" == "esc" ]; then
            SELECTED_INDEX="-1"
            SELECTED_VALUE=""
            break
        fi

        # State-based behaviour:
        case ${STATE} in
            "first")
                if [ "$COUNT" != "1" ] && [ "$key" == "down" ]; then
                    __set_selection $(( SELECTED_INDEX + 1 ))
                fi
            ;;

            "middle")
                if [ "$key" == "down" ]; then
                    __set_selection $(( SELECTED_INDEX + 1 ))
                elif [ "$key" == "up" ]; then
                    __set_selection $(( SELECTED_INDEX - 1 ))
                fi
            ;;

            "last")
                if [ "$COUNT" != "1" ] && [ "$key" == "up" ]; then
                    __set_selection $(( SELECTED_INDEX - 1 ))
                fi
            ;;
        esac

        # set current state of the menu
        if [ "$SELECTED_INDEX" == "0" ]; then
            STATE="first";
        elif [ "$SELECTED_INDEX" == "$(( $COUNT - 1 ))" ]; then
            STATE="last";
        else
            STATE="middle"
        fi
        
    done
    
    # writes to the output variable the values as as array
    # [0] = Name of the option chosen
    # [1] = Index of the option chosen
    eval "${VARIABLE_TO_WRITE}=(\"${SELECTED_VALUE}\" ${SELECTED_INDEX})"

    # unset functions so they are not available outside of this scopee
    unset __read_input
    unset __set_selection

}
