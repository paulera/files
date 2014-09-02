###########
# ALIASES #
###########

# ls
alias ll='ls -lh --group-directories-first --time-style=long-iso'
alias ls='ls --color=always'

# mkdir - create subdirs automatically
alias mkdir='mkdir -p'

# ff (find in files): uses grep --color=always to highlight the searched text
alias ff='grep --color=always -B2 -F2 -i -n -H -a'

#vim - using custom configuration file
vim='vim -u $FILESROOT/vimrc'

