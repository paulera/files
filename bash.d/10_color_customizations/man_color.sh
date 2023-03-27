# Less Colors for Man Pages

# Source: https://unix.stackexchange.com/questions/119/colors-in-man-pages


# This repetitive use of tput has low performance:
#export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
#export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
#export LESS_TERMCAP_me=$(tput sgr0)
#export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
#export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
#export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
#export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
#export LESS_TERMCAP_mr=$(tput rev)
#export LESS_TERMCAP_mh=$(tput dim)
#export LESS_TERMCAP_ZN=$(tput ssubm)
#export LESS_TERMCAP_ZV=$(tput rsubm)
#export LESS_TERMCAP_ZO=$(tput ssupm)
#export LESS_TERMCAP_ZW=$(tput rsupm)
#export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal


# The command below was used to extract variable names from this file, get their
# escaped equivalents and append them here
# for i in $(cat $FILESROOT/bash.d/10_color_customizations/man_color.sh | grep export | sed -E 's/^export ([A-Za-z_0-9]*).*/\1/g'); do echo "export $i=$(eval echo -E \$$i)"; done >> /home/paulo/.files/bash.d/10_color_customizations/man_color.sh
# If you want to redefine the params above using tput, remove the definitions below,
# uncomment the definitions above, let the FILES repo load normally then rund the
# forementioned command.

# --------- better performance colorizing for man pages ---------
export LESS_TERMCAP_mb="[1m[32m"
export LESS_TERMCAP_md="[1m[36m"
export LESS_TERMCAP_me="(B[m"
export LESS_TERMCAP_so="[1m[33m[44m"
export LESS_TERMCAP_se="[27m(B[m"
export LESS_TERMCAP_us="[4m[1m[37m"
export LESS_TERMCAP_ue="[24m(B[m"
export LESS_TERMCAP_mr="[7m"
export LESS_TERMCAP_mh="[2m"
export LESS_TERMCAP_ZN=""
export LESS_TERMCAP_ZV=""
export LESS_TERMCAP_ZO=""
export LESS_TERMCAP_ZW=""
export GROFF_NO_SGR=1
