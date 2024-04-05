# Manipulation of PATH
# from less to more priority

# FILES repo soft binaries
# TODO: do I really need soft binaries?
export PATH="$FILESROOT/soft/bin:$PATH:"

# FILES scripts
export PATH="$FILESROOT/bin:$PATH:"

# User bin folder at ~/bin
export PATH="$HOME/bin:$PATH:"
