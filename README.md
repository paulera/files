This is a bundle of scripts that I usually install in every linux machine I need to work. It makes a few personal tweaks in environment configuration, described below. Useful also when using third servers (as website hostings), where I use to have control only over my home folder.
# Install #

#### Inside home folder (no root privilege needed) ####
``` bash
cd ~
git clone https://github.com/paulera/files
cp ~/.bashrc ~/.bashrc.old
echo "if [ -f ~/files/bash.d/run_bash ]; then . ~/files/bash.d/run_bash; fi" >> ~/.bashrc
```
#### For all users (suggestion: inside */opt* folder) ####

``` bash
cd /opt
sudo git clone https://github.com/paulera/files
sudo cp /etc/bash.bashrc /etc/bash.bashrc.old

# Add the run_bash call in each EXISTING user's .bashrc file
echo "if [ -f /opt/files/bash.d/run_bash ]; then . /opt/files/bash.d/run_bash; fi" >> /home/user/.bashrc

# Enable to the root user
echo "if [ -f /opt/files/bash.d/run_bash ]; then . /opt/files/bash.d/run_bash; fi" >> /root/.bashrc

# Make it already available for NEW users
echo "if [ -f /opt/files/bash.d/run_bash ]; then . /opt/files/bash.d/run_bash; fi" >> /etc/skel/.bashrc
```
Note that these commands will:
- create a folder *files*
- make a backup of your *bashrc* file with *.old* extension
- append to your *bashrc* file a command that runs *files/bash.d/run_bash*

# Features #

#### INSTALL STANDALONE APPLICATIONS #####

The **$FILESROOT/soft_installers** folder, there are 2 kind of files:
- **installer_base.sh**: Every installer use this file, calling it with dot (so its contents will be 'injected' on the installer) and then calling the **installer_bootstrap** function. After that, the installer can use the _$APPFOLDER_ variable to do the installation. [See examples](https://github.com/paulera/files/tree/master/soft_installers).
- _other installers_: the others files inside the **soft_installers** folder are intented to install those application inside **_$FILESROOT/soft_**. The reason for that is to shrink the bundle size, make it fexible and also easy to upgrade.

#### SPECIAL FOLDERS #####

If a user create these directories inside home, they will have the described behavior:
- *~/bash.d*: all .sh files inside this directory will be executed everytime you open a terminal or do an ssh.
- *~/bin*: folder to store custom scripts, referenced in PATH environment variable. The **scriptme** command use this folder.
- *~/soft*: just a folder intented to centralize _standalone_ software. It's recommended to have their executables linked at **_bin_** folder

Note that the **_$FILESROOT_** folder also have these subfolders, and the mentioned behaviors will be applied to both.

#### ENVIRONMENT ####

- Create a **_$FILESROOT_ environment var**, pointing to the *files* location
- Apply more specific colors to dirs using the file *$FILESROOT/dircolors*
- Change the PS1 format
- see [$FILESROOT/bash.d/02_alias.sh](https://github.com/paulera/files/blob/master/bash.d/02_alias.sh) for more

#### TWEAKS ####

- Turns bash autocompletion case **IN**sensitive

#### FUNCTIONS ####

- **_extract_ &lt;file&gt;**: identify the file type by extension and try to extract
- **_ff_ "Text to find"**: search for the text inside all files (using grep). -R to do it recursively.

#### SHELL SHORTCUTS ####

All shell shortcuts are defined in files/bash.d/04_shell_sortcuts.sh

- **_files_**: go to '$FILESROOT' folder
- **_down_**: go to ~/downloads
- **_desk_**: go to ~/desktop
- **_img_**: go to ~/images
- **_doc_**: go to ~/documents
- **_mp3_**: go to ~/mp3
 
##### Smart shortcuts #####
- **_soft_**: go to the _soft_ folder
- **_bashd_**: go to _bash.d_ folder
- **_bin_**: go to _bin_ folder

A smart shortcut first looks for the folder inside home folder. If the user have not created such directory, you will be redirected to the directories inside $FILESROOT location. To force smart shortcuts to take you to the respective $FILESROOT subdirectory, use **2** as parameter: **_bin_ 2**, for example

#### SCRIPTS inside files/bin ####

- **_cecho_**: colored echo - usage: **_cecho_ green "It's OK!\n"**
- **_dirsize_**: list the size of everything, in the current dir
- **_doloop_** <command>: Execute the command, repeatedly, with 1 second pause, clearing screen. Some bugs when using piped commands.
- **_externalip_**: return the IP address seen by the web
- **_localip_**: return the local network IP address
- **_now_**: current time in HH:MM:SS (24h format)
- **_psaux_** <name to grep>: do the ps aux, grepping the parameter - ex: psaux java
- **_remove_cr_**: Fix all lines in a file (or all files in current folder) to make them end with just LF, removing all CR characters.
- **_scriptme_**: one of my favourites. Create a script inside _~/bin_ and edits it in vim. It will start with the **$FILESROOT/script_template** contents, and will have **_chmod_ +x* if you leave vim saving it.
- **_today_**: current date as YYYY-MM-DD
- **_trash_**: send files to ~/.trash
- **_unmd5_**: Uses Insomnia247.nl Hashdb API to lookup a MD5 hash
- **_unsha1_**: Uses Insomnia247.nl Hashdb API to lookup a SHA1 hash

#### TO-DO list: ####
- Document set_defaults folder
- Document the soft installers
