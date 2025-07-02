#!/bin/bash
function set_terminal_title() {
  local pwd="${PWD/#$HOME/~}"
  local tty="$(tty)"
  local cols=$(tput cols)
  local lines=$(tput lines)
  echo -ne "\033]0;${EMOJI} ${pwd}\007"
}
PROMPT_COMMAND="set_terminal_title;${PROMPT_COMMAND}"
