#! /bin/sh
# /etc/init.d/dropzone
# Oskar Agustsson (c) 2012

# Some things that run always
sudo touch /var/lock/dropzone

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting dropzone"
    notify-send --expire-time=750 Dropzone "Starting"

SP=0
for i in  `cat /etc/dropzone/dropzone_user.config`
do sudo -u $i /home/$i/bin/dropzone/dropzone > /dev/null 2>& 1 &  

done
# > /dev/null 2>& 1 &
    ;;
  stop)
echo "Stopping dropzone"
    notify-send --expire-time=750 Dropzone "Stopping"    
ps -ef | grep Dropzone | grep -v grep | awk '{print $2}' | xargs kill -9 > /dev/null 2>& 1 &
    rm /var/lock/dropzone    
    ;;
  *)
    echo "Usage: /etc/init.d/dropzone {start|stop}"
    exit 1
    ;;
esac

exit 0
