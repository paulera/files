This is a bundle of scripts that I usually install in every
linux machine where I need to work.
It makes a few personal tweaks in environment configuration.

Basically, your must run the file files/bash.d/run_bash, and all the magic will happend 

To make it work, do the following:
Create a folder ~/files
Put this inside your ~/.bashrc, or /etc/bash.bashrc:
if [ -f ~/files/bash.d/run_ash ]; then . ~/files/bash.d/run_bash; fi

Actually, it does the following:

# FOLDERS #

~/bash.d: all .sh files inside will be executed everytime you open a termina or do an ssh.
~/bin: folder to store custom scripts, referenced in PATH environment variable

# ENVIRONMENT #

Apply dircolors (~/files/dircolors)
Create a $FILESROOT environment var
Change the PS1 format
see files/bash.d/02_alias.sh for more

# TWEAKS #

Apply custom vimrc configuration (~/files/vimrc)
Bash autocompletion case INsensitive (see files/bash.d/09_behavior.sh)

# FUNCTIONS #

extract <compressed file>: identify the file type and try to extract (see files/bash.d/04_func_extract.sh)
ff <"Text to find"> *: search for the text inside all files. -R to do it recursively.

# SHELL SHORTCUTS #

All shell shortcuts are defined in files/bash.d/04_shell_sortcuts.sh
* files: go to 'files' folder
* soft: go to ~/soft folder
* bashd: go to ~/bash.d folder
* bin: go to ~/bin folder
down: go to ~/downloads
desk: go to ~/desktop
img: go to ~/images
doc: go to ~/documents
mp3: go to ~/mp3
 
The shortcuts marked with * are 'smart shortcuts'. If you do not create these
folders in your home, you will be redirected to the directories inside 'files' location.
If you have created the folders, you can call still use the smart shortcuts calling with "2"
as parameter: 'bin 2', for example

# SCRIPTS indide files/bin #

cecho: colored echo - usage: cecho green "It OK!\n"
dirsize: list the size of everything, in the current dir
now: actual time in HH:MM:SS (24h format)
psaux <name to grep>: do the ps aux, grepping the parameter - ex: psaux java
scriptme: on of my favourites. Create a script in ~/bin and edits it. It will start with the
          files/script_template contents, and will be chmoded +x after leaving vim.

