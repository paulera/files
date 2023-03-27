# Directory navigation assistance with interactive menu
cdl2() {
    unset LIST
    LIST=()
    while read -r line; do
        LIST+=("$line");
    done < <(dirs -p | tail -n +2 | sort | uniq)

    echo
    echo "Locations you have been recently:"
    echo

    DEST_DIR=""
    menu DEST_DIR "${LIST[@]}"
    if [ ! -z "${DEST_DIR}" ]; then
        eval pushd "${DEST_DIR[0]}" > /dev/null
        echo
    fi
}

