#!/bin/sh

# Create an installer to use inotify monitoring for a folder Droplr style.
# Oskar Agustsson (c) 2012

whoami > /tmp/user.txt
SP=0
for  i in `cat /tmp/user.txt`
do sudo rm -rf /home/$i/bin/dropzone ; rm -rf /home/$i/Desktop/Dropzone ; sudo /etc/init.d/dropzone stop; sudo rm /etc/init.d/dropzone
sudo rm -rf /etc/dropzone
# echo "Uninstallation finished"
notify-send --expire-time=500 Dropzone "Has been uninstalled successfully" 

done
