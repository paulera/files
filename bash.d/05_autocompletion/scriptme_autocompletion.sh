_scriptme_completion() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local options=()
    options+=( $(basename -a ${FILESROOT}/bin/*) )
    if [ -d ~/bin ]; then
        options+=( $(basename -a ~/bin/*) )
    fi
    COMPREPLY=( $(compgen -W "${options[*]}" -- "${cur}") )
}
complete -F _scriptme_completion scriptme

