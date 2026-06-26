files_debug_run() {
    REMOVE_AFTER=0
    if [ ! -f "~/.files_debug" ]; then
        REMOVE_AFTER=1
        touch ~/.files_debug
    fi
    files_reload
    if [ "$REMOVE_AFTER"=="0" ]; then
        rm ~/.files_debug
    fi
}
