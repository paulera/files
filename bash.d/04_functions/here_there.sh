#!/bin/bash

here() {
    if [ "$OS" == "wsl" ] && [ -r /mnt/c/Windows/System32/clip.exe ]; then
    	pwd | /mnt/c/Windows/System32/clip.exe
    fi
	pwd > ~/.here
}

there() {

    DEST=""
    if [ "$OS" == "wsl" ] && [ -r /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe ]; then
        DEST=$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Get-Clipboard | tr "\n" "\r" | sed 's/\r//g')
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
