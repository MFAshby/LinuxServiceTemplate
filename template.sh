#!/bin/bash
#
# chkconfig: 35 90 12
# description: MAT server
#
# Get function from functions library
. /etc/init.d/functions
# Start the service MAT
start() {
        initlog -c "echo -n Starting MAT server: "
        /path/to/MAT &
        ### Create the lock file ###
        touch /var/lock/subsys/MAT
        success $"MAT server startup"
        echo
}
# Restart the service MAT
stop() {
        initlog -c "echo -n Stopping MAT server: "
        killproc MAT
        ### Now, delete the lock file ###
        rm -f /var/lock/subsys/MAT
        echo
}
### main logic ###
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  status)
        status MAT
        ;;
  restart|reload|condrestart)
        stop
        start
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart|reload|status}"
        exit 1
esac
exit 0
