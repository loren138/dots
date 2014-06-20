# Simple setup for Ubuntu servers

## Set Editor to something useful
sudo update-alternatives –config editor

## Sudo without password
sudo visudo

At the end of the file add:
username ALL=(ALL) NOPASSWD: ALL
