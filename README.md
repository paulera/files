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
sudo echo "if [ -f /opt/files/bash.d/run_bash ]; then . /opt/files/bash.d/run_bash; fi" >> /etc/bash.bashrc
```
Note that these commands will:
- create a folder *files*
- make a backup of your *bashrc* file with *.old* extension
- append to your *bashrc* file a command that runs *files/bash.d/run_bash*

# Features #

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
- **_now_**: actual time in HH:MM:SS (24h format)
- **_psaux_** <name to grep>: do the ps aux, grepping the parameter - ex: psaux java
- **_scriptme_**: one of my favourites. Create a script inside _~/bin_ and edits it in vim. It will start with the **_$FILESROOT/script_template_** contents, and will have **_chmod_ +x* if you leave vim saving it.

#### TO-DO list: ####

- Create *$FILESROOT/bash.d/09_vimrc.sh*: Apply custom vimrc configuration from the file *$FILESROOT/vimrc*
- More links in this description
- Create a _install_ folder inside _soft_ folder, with scripts that automatically downloads and make links based on _$FILESROOT_ path

