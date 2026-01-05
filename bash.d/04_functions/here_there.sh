#!/bin/bash

here() {
    DIR=$(echo -n $(pwd))
    if [ "$OS" == "wsl" ] && [ -r /mnt/c/Windows/System32/clip.exe ]; then
    	printf $DIR | /mnt/c/Windows/System32/clip.exe
    fi
    if [ "$OS" == "mac" ]; then
        printf $DIR | pbcopy
    fi
    printf $DIR > ~/.here
}

there() {

    DEST=""
    if [ "$OS" == "wsl" ] && [ -r /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe ]; then
        DEST=$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Get-Clipboard | tr "\n" "\r" | sed 's/\r//g')
    elif [ "$OS" == "mac" ]; then
        DEST=$(pbpaste)
    fi

    if [ -d "$DEST" ]; then
        cd "$DEST"
    elif [ -f "~/.here" ] && [ -d "$(cat ~/.here)" ]; then
        cd "$(cat ~/.here)"
    else        
        echo "No location to go. Try copying a path to the clipboard or running the command here somewhere."
    fi
}

export -f here
export -f there
