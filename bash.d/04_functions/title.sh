function title() { echo -ne "\033]0;$1\a"; }
export -f title
