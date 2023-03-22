# bash.d folder

This is the location of the FILES bootstrap scripts. They
all run when a terminal session is started.

## Running the scripts

The only thing to do to activate them is to source the
file `run_bash` in `.bashrc`, `.bash_profile`, or wherever
things are called when a terminal session is started.

The script `run_bash` *must be sourced*, not called as
script. It will find everything ending with `.sh` in this 
folder, sort and run following the numbers indication.

## Support to other `*nix` systems

Scripts exclusive of other environments (cygwin, mac, wsl, etc)
must use the variable `$OS` by themselves. `run_bash`
doesn't make any distinction of them, but could in a future
refactor.

> Idea (example): only in a mac environment, the scripts with extension
> .mac.sh would be called. This would reduce the number of
> conditionals running during bootstrap. `run_bash` gets a list
> of files to run using `find`, and it could be tweaked to
> consider or ignore certain scripts depending on the OS and
> their extensions
