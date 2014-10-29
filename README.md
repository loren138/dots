# Simple setup for Ubuntu servers

## Set Editor to something useful
sudo apt-get install vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 200
sudo update-alternatives –config editor

## Sudo without password
sudo visudo

#At the end of the file add (replacing username with your username)
username ALL=(ALL) NOPASSWD: ALL
