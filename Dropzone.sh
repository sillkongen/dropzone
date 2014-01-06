#!/bin/sh

. /etc/dropzone/dropzone_url.config
# You need to install inotify-tools for this to work and also xclip.

# The inotify tools have a github web page here https://github.com/rvoicilas/inotify-tools/wiki it is written by Rohan McGovern and maintained by Radu Voicilas

# This script is written by Nick Lothian (http://nicklothian.com/) just slightly modified for the SCP push rather than an rsync. I also added the notification and the copy to clipboard section.
echo "Dest is: $DESTINATION" >&2
echo "URL is: $URL" >&2

# get the current path
CURPATH=`pwd`
# URL="http://192.168.1.159/Dropzone/"

# rm -f ~/Desktop/Dropzone/*

# The folder you want to monitor changes in. The folder is named Dropzone which sits in the Desktop folder.
inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f' -e close_write  ~/Desktop/Dropzone | while read date time dir file; do

       FILECHANGE=${dir}${file}
       # convert absolute path to relative
       FILECHANGEREL=`echo "$FILECHANGE" | sed 's_'$CURPATH'/__'`

# Copy my files to an external server in this case it is a folder sitting on a webserver. 
#	scp -i "You SSH key here"  $FILECHANGEREL user@your.server.here.tld:"Your.local.path.on.server.here"

scp $FILECHANGEREL $DESTINATION 

# Copy the URL to clipboard to make life easy when sending this in an email or an IM chat.	
        echo "$URL${file}" | xclip -selection clipboard &
# Make a notification from Dropzone with the URL that was pushed.        
#        echo "$URL${file}" | ~/bin/notify.py
	notify-send --expire-time=1750 Dropzone "$URL${file}"
rm -f $FILECHANGEREL 
done
