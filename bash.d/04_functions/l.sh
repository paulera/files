# minimal file listing
alias l="o"
if [ "$(type -t l)" == "alias" ]; then
    files_debug "Unregistering alias l (to override it)" "warning"
    unalias l
fi

l() {
    ls -lF --group-directories --color=always --time-style=+"" --block-size=T $* | awk '{ $2=""; $5=""; $3=$3":"$4; $4=""; print }' | sed 's/  */ /g' | tail -n +2;
}
export -f l
