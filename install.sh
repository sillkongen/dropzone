#!/bin/sh

# Create an installer to use inotify monitoring for a folder Droplr style.
# Oskar Agustsson (c) 2012

(
echo "10" ; sleep 1
mkdir -p ~/bin/dropzone
echo "# Creating a dropzone under bin in your home folder" ; sleep 1
echo "20" ; sleep 1
echo "# Creating a Dropzone folder on your desktop" ; sleep 1
mkdir -p ~/Desktop/Dropzone
echo "50" ; sleep 1
echo "# finalize install with startup scripts " ; sleep 1
echo "75" ; sleep 1
echo "# Launching Dropzone for the first time as a background process" ; sleep 1
cp dropzone.init.sh /etc/init.d/dropzone
/etc/init.d/dropzone start
echo "100" ; sleep 1
) |
zenity --progress --title="Install Dropzone" --text="Starting install Dropzone version 0.1                   " --percentage=0

# zenity --question --text "Do you want to install a startup script for this?" && zenity --info --text="test"

if [ "$?" = -1 ] ; then
zenity --error --text="Install cancelled."
fi