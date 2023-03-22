#!/bin/bash

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

# helper function to list git aliases
githelp() {
    alias | grep "='git" | sed "s/alias \([a-zA-Z0-9]*\)='\(.*\)'/\1 = \2/g"
}
