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

# color grep
alias grepp='grep --color=auto -i -n'

#rot13
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

# replace gs (GhostScript) with git status function. Escape \gs to run the original command.
alias gs="$FILESROOT/bin/gs"
