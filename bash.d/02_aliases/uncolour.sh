# Approaches to remove colour from commands output:
#
# https://stackoverflow.com/questions/17998978/removing-colors-from-output
# sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g"
#
# https://stackoverflow.com/questions/17998978/removing-colors-from-output
# sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,3})*)?[mGK]//g"
# 
# https://unix.stackexchange.com/questions/55546/removing-color-codes-from-output/55547#55547
# sed -r "s/\x1B\[[0-9;]*[JKmsu]//g"

alias uncolour="sed -r 's/\x1B\[[0-9;]*[JKmsu]//g'"
alias uncolor="uncolour"
