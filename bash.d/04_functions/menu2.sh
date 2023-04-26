 

# This script must be sourced, to declare the menu function so it can
# instantiate the variable with the result of the user choice in the
# current session

menu2() {
    
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
    # TODO: handle ESC to cancel the selection. Currently this is done with CTRL+C
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
    __render_all_options() {
        printf "${__reset}"
        for (( __i=0; __i < $__OPTIONS_COUNT; __i++ )); do
            printf "  ${__OPTIONS[$__i]}\n"
        done
        unset __i
    }

    # Move cursor up $1 lines
    __up() {
        printf "\033[$1A"
    }

    # Move cursor up $1 lines
    __down() {
        printf "\033[$1B"
    }

    __unselect_option() {
        INDEX=$1
        MOVE=$(( $__OPTIONS_COUNT - $INDEX ))
        __up $MOVE
        printf "\r\033[K" # erase lin"
        printf "${__color_unselected}"
        echo -n "  ${__OPTIONS[${INDEX}]}" | sed "s/$'\n'/.../g"
        printf "${__reset}"
        __down $MOVE
        printf "\r"
    }

    __select_option() {
        INDEX=$1
        MOVE=$(( $__OPTIONS_COUNT - $INDEX ))
        __up $MOVE
        printf "\r\033[K" # erase line
        printf "${__color_selected}"
        echo -n "> ${__OPTIONS[${INDEX}]}"
        printf "${__reset}"
        __down $MOVE
        printf "\r"
    }

    # Move the cursor to the begin of the options list and re-render it
    # highlighting the desired option. The option will be assigned to the
    # variables __SELECTED_INDEX and __SELECTED_VALUE.
    # Usage: __set_selection <option index>
    __set_selection() {
        if [ ! -z "${__SELECTED_INDEX}" ]; then
            __unselect_option ${__SELECTED_INDEX}
        fi
        __SELECTED_INDEX=$1
        __SELECTED_VALUE=${__OPTIONS[$__SELECTED_INDEX]}
        __select_option ${__SELECTED_INDEX}
    }

    # --- Script main -----------------

    START="top"
    for (( i=1; i<=$#; i++ )); do
        case "${!i}" in
            --help)
            shift
            # TODO: implement usage()
            ;;

            -t|--top)
            # top is the default option
            shift
            ;;

            -b|--bottom)
            # bottom
            START="bottom"
            shift
            break
            ;;
        esac
    done

    __color_unselected="\033[49m"
    __color_selected="$(tput setab 17)"

    __VARIABLE_TO_WRITE=$1
    shift
    __OPTIONS=()
    IFS=
    while read -r line; do
        line=$(echo -en "$line" | sed -e 's/^[[:space:]]*//;s/[[:space:]]*$//')
        if [ ! -z "$line" ]; then
            __OPTIONS+=("$line")
        fi
    done <<<$@

    __OPTIONS_COUNT=${#__OPTIONS[@]}
    if [ "$START" == "bottom" ]; then
        __STATE="last" # menu selection state: first, last, middle
        __SELECTED_INDEX=$(( $__OPTIONS_COUNT - 1 )) # last
    else
        __STATE="first" # menu selection state: first, last, middle
        __SELECTED_INDEX=0 # first
    fi
    
    __render_all_options
    __set_selection ${__SELECTED_INDEX} 

    while true; do
        
        # wait for a key to be pressed
        __key=$(__read_input)

        # The ENTER and ESC keys are interruption - doesn't depend on state.
        if [ "$__key" == "enter" ]; then
            break;
        elif [ "$__key" == "esc" ]; then
            __SELECTED_INDEX="-1"
            __SELECTED_VALUE=""
            break
        fi

        if [ -z "$__key" ]; then
            continue
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
    
    # remove colours from value
    __SELECTED_VALUE=$(echo -ne "${__SELECTED_VALUE}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,3})*)?[mGK]//g" )

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

h ()
{
    HIGHLIGHT=`echo -e '\033[1;34m'`;
    NORMAL=`echo -e '\033[0m'`;
    if [ -z $1 ]; then
        echo "Search the commands history";
        echo "Usage: h <search terms>";
    else
        history | GREP_COLOR="1;32" grep --color=auto -i --color=always $* | sed -e "s/^ \([0-9]\+\)/\n $HIGHLIGHT\1$NORMAL/g";
        echo;
        echo -e " \033[1;37mType \033[1;34m!<number>\033[1;37m to recall a command\033[0m";
        echo;
    fi
}

export -f menu2
