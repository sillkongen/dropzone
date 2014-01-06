#!/bin/sh

# Create an installer to use inotify monitoring for a folder Droplr style.
# Oskar Agustsson (c) 2012

whoami > /tmp/user.txt

sudo mkdir /etc/dropzone

sudo cp /tmp/user.txt /etc/dropzone/dropzone_user.config 

SP=0
for  i in `cat /tmp/user.txt`
do mkdir -p /home/$i/bin/dropzone ; mkdir -p /home/$i/Desktop/Dropzone ; cp Dropzone.sh /home/$i/bin/dropzone/dropzone 
done


sudo cp dropzone.init.sh /etc/init.d/dropzone
sudo echo 'URL="http://hostname.tld/path_to/Dropzone/"' > /tmp/dropzone_url.config

sudo echo 'DESTINATION="user@hostname:/path/"' >> /tmp/dropzone_url.config

sudo cp /tmp/dropzone_url.config /etc/dropzone/dropzone_url.config
notify-send Dropzone Starting
sudo -u $i /etc/init.d/dropzone start

rm /tmp/user.txt
