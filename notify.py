#!/usr/bin/python

# You need to have Gnome’s libnotify and Python’s pynotify package installed for this to work.
# This script is written by Kevin DuBois’s and you can read about it here: http://kdubois.net/?p=1656

import pynotify
import sys
 
pynotify.init("Quick Notify")
input = sys.stdin.readline()
msg = pynotify.Notification("Dropzone:", input)
msg.show()
