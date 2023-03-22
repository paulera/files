# Override ls to make it always colored
if [ "$(type -t ls)" == "alias" ]; then
    files_debug "Unregistering alias ls (to override it)" "warning"
    unalias ls
fi
alias ls='ls --color=always'


# Unregister ll if present
if [ "$(type -t ll)" == "alias" ]; then
    files_debug "Unregistering alias ll (to override it)" "warning"
    unalias ll
fi
alias ll='ls -lhF --group-directories-first --time-style=long-iso -N'


