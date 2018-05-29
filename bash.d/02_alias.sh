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
alias grepp='grep --color=always -i'
alias grepr='GREP_COLOR="1;41" grep --color=always -i'
alias grepg='GREP_COLOR="1;42" grep --color=always -i'
alias grepy='GREP_COLOR="30;43" grep --color=always -i'
alias grepb='GREP_COLOR="1;44" grep --color=always -i'
alias grepp='GREP_COLOR="1;45" grep --color=always -i'
alias grepc='GREP_COLOR="30;46" grep --color=always -i'
alias grepw='GREP_COLOR="30;47" grep --color=always -i'

#rot13
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

# replace gs (GhostScript) with git status function. Escape \gs to run the original command.
alias gs="$FILESROOT/bin/gs"

# git commamands simplified (credit: http://blog.taylormcgann.com/2012/06/13/customize-your-shell-command-prompt)
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg2='git log --date-order --all --graph               --date="format:%d-%m-%Y %H:%M" --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset %C(red bold)%d %Creset%s"'
alias glg='git log --date-order --all --graph --name-status --date="format:%d-%m-%Y %H:%M" --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset%C(red bold)%d %Creset %C(white bold)%s%Creset"'

