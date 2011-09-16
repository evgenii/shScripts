#! /bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
NAME=connector
MOUNT_NAME=sshfs
UNMOUNT_NAME=fusermount
WORKING_PATH=/home/evgenii

# Include nginx defaults if available
#if [ -d $WORKING_PATH/$2 ] ; then
#    . /etc/default/nginx
#fi

case "$1" in
  start)
    echo -n "Mount $2 to $WORKING_PATH/$2
"
    sshfs $2:/ $WORKING_PATH/$2/
    echo "$2 mounted"
    ;;
  stop)
    echo -n "UnMount $2 to $WORKING_PATH/$2
"
    fusermount -u $WORKING_PATH/$2/
    echo "$2 unmounted"
    ;;
  status)
    echo -n "Status of $2
"
    df -h | grep $2
    ;;
  all_status)
    df -h
    ;;
  *)
    echo "Usage: $NAME {start|stop|status|all_status} {login@host}" >&2
    exit 1
    ;;
esac

exit 0
