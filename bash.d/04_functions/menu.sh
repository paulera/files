#!/bin/bash

# This script must be sourced, to declare the menu function so it can
# instantiate the variable with the result of the user choice in the
# current session

menu() {
    
    if [ "$1" == "--help" ]; then
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
        echo "menu MYCHOICE \"Pear\" \"Grapes\" \"Apple\" \"Salad\""
        echo
        echo "echo \$MYCHOICE"
        echo "echo \${MYCHOICE[0]}"
        echo "echo \${MYCHOICE[1]}"
        echo
        echo "if [ \"\$MYCHOICE\" == \"Apple\" ]; then ... ; fi"
        echo "if [ \"\${MYCHOICE[0]}\" == \"Apple\" ]; then ... ; fi"
        echo "if [ \"\${MYCHOICE[1]}\" == \"2\" ]; then ... ; fi"
        echo
        echo "(the script that declares this function must be sourced, not called)"
        echo
        return 0
    fi

    if [ "$#" -lt 2 ]; then
        echo "Invalid number of parameters. Run menu --help for usage info."
        return 1
    fi

    # --- Script functions -----------------

    # wait for a key to be pressed and echoes "up", "down" or "enter"
    # TODO: cater for user pressing ESC to cancel the selection. Currently this is done with CTRL+C
    __read_input() {
        read -s -n1 __char
        case $__char in
            "") echo "enter" ;;
            "A") echo up ;;  # ascii 65
            "B") echo down ;;   # ascii 66
        esac
    }

    # Render the list of options. __set_selection the one indexed by the first
    # parameter (if provided)
    # Usage: render_option [option to __set_selection]
    __reset="\033[0m"
    __cyan="\033[1;36m"
    __render_options() {
        __CURRENT_OPTION="" && [ ! -z "$1" ] && __CURRENT_OPTION="$1"
        for (( __i=0; __i < $__OPTIONS_COUNT; __i++ )); do
            echo -en "\033[K" # erase until end of line to fix glitches
            if [ "$__i" == "$__CURRENT_OPTION" ]; then
                echo -ne ${__cyan}"> "
            else
                echo -ne ${__reset}"  "
            fi
            echo -e ${__OPTIONS[$__i]}"${__reset}"
        done
        unset __i
    }

    # Move the cursor to the begin of the options list and re-render it
    # highlighting the desired option. The option will be assigned to the
    # variables __SELECTED_INDEX and __SELECTED_VALUE.
    # Usage: __set_selection <option index>
    __set_selection() {
        __SELECTED_INDEX=$1
        __SELECTED_VALUE=${__OPTIONS[$__SELECTED_INDEX]}
        
        # Moves the cursor $__OPTIONS_COUNT lines up, to re-render the menu
        echo -en "\033[${__OPTIONS_COUNT}A"

        __render_options $1
    }

    # --- Script main -----------------

    __VARIABLE_TO_WRITE=$1
    shift
    __OPTIONS=( "$@" )
    __OPTIONS_COUNT=${#__OPTIONS[@]}
    __SELECTED_INDEX=0
    __SELECTED_VALUE=${__OPTIONS[$__SELECTED_INDEX]}
    __STATE="first" # menu selection state: first, last, middle
    __render_options 0

    while true; do
        
        # wait for a key to be pressed
        __key=$(__read_input)

        # The ENTER and ESC keys are interruption - doesn't depend on state.
        if [ "$__key" == "enter" ]; then break; fi
        if [ "$__key" == "esc" ]; then
            __SELECTED_INDEX="-1"
            __SELECTED_VALUE=""
            break
        fi

        # State-based behaviour:
        case ${__STATE} in
            "first")
                if [ "$__OPTIONS_COUNT" != "1" ] && [ "$__key" == "down" ]; then
                    __set_selection $(( __SELECTED_INDEX + 1 ))
                fi
            ;;

            "middle")
                if [ "$__key" == "down" ]; then
                    __set_selection $(( __SELECTED_INDEX + 1 ))
                elif [ "$__key" == "up" ]; then
                    __set_selection $(( __SELECTED_INDEX - 1 ))
                fi
            ;;

            "last")
                if [ "$__OPTIONS_COUNT" != "1" ] && [ "$__key" == "up" ]; then
                    __set_selection $(( __SELECTED_INDEX - 1 ))
                fi
            ;;
        esac

        # set current state of the menu
        if [ "$__SELECTED_INDEX" == "0" ]; then
            __STATE="first";
        elif [ "$__SELECTED_INDEX" == "$(( $__OPTIONS_COUNT - 1 ))" ]; then
            __STATE="last";
        else
            __STATE="middle"
        fi
        
    done
    
    # writes to the output variable the values as as array
    # [0] = Name of the option chosen
    # [1] = Index of the option chosen
    eval "${__VARIABLE_TO_WRITE}=(\"${__SELECTED_VALUE}\" ${__SELECTED_INDEX})"

    # unset all internal functions and variables so they are not available
    # outside of this function scope
    unset __OPTIONS
    unset __OPTIONS_COUNT
    unset __SELECTED_INDEX
    unset __SELECTED_VALUE
    unset __STATE
    unset __VARIABLE_TO_WRITE
    unset __cyan
    unset __key
    unset __read_input
    unset __render_options
    unset __reset
    unset __set_selection
    unset __usage
    # command to help writing all the "unset"s above:
    # for i in $(cat menu.sh | sed 's/^[\t ]*//g' | sed -e 's/ .*//g' | sed -e 's/[^ a-zA-Z_].*$//g' | grep __ | sort | uniq); do echo "unset $i"; done



}
