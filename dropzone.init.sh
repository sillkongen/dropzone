#! /bin/sh
# /etc/init.d/dropzone
# Oskar Agustsson (c) 2012

# Some things that run always
touch /var/lock/dropzone

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting dropzone "
sudo -u oskar /home/oskar/bin/dropzone/dropzone > /dev/null 2>& 1 &
    ;;
  stop)
    echo "Stopping dropzone"
    ps -ef | grep Dropzone | grep -v grep | awk '{print $2}' | xargs kill -9 > /dev/null 2>& 1 &
    rm /var/lock/dropzone    
    ;;
  *)
    echo "Usage: /etc/init.d/dropzone {start|stop}"
    exit 1
    ;;
esac

exit 0