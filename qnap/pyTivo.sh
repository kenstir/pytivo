#!/bin/sh
#
# pyTivo.sh - QNAP init script

CONF=/etc/config/qpkg.conf
QPKG_NAME="pyTivo"
QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`
PYTHON=/opt/bin/python

case "$1" in
start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
        echo "$QPKG_NAME is disabled."
        exit 1
    fi

    cd $QPKG_ROOT
    $PYTHON pyTivo.py > /var/log/pytivo.log 2>&1 &
    echo $! > /var/run/pyTivo.pid
    ;;

stop)
    pid=`cat /var/run/pyTivo.pid`
    test -n "$pid" && kill $pid
    ;;

restart)
    $0 stop
    $0 start
    ;;

*)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
