dropzone
========

Droplr replacement to upload with scp directly to webserver and generate a URL + copy the URL after upload to your clipboard. Relying on inotify-tools for this in Linux.

Update 06/01/2014 
Changed notification method, create a config file for destination and user. Dropped the zenity UI. 

You will have to manually do:

	sudo vi /etc/dropzone/dropzone_url.config

	and

	sudo vi /etc/dropzone/dropzone_user.config

