#! /bin/sh
# Generic perlbrew init script
#
# description: Runs the generic perlbrew init script
#
# chkconfig: 345 80 20

###### EDIT THE FOLLOWING LINES ######

export PERLBREW_ROOT=/opt/perl5/perlbrew
export PERLBREW_HOME=/opt/perl5/home
source ${PERLBREW_ROOT}/etc/bashrc

perlbrew use perl-5.12.3@test

APPNAME=my_daemon
COMMAND=perl
SCRIPT=/opt/scripts/my_daemon.pl
PIDFILE=/var/run/$APPNAME.pid
OPTIONS="--dont_close_all_files"

###### STOP EDITING ######

COMMAND=$(which $COMMAND)

# Source function library
. /etc/rc.d/init.d/functions

start() {
    echo -n "Starting $APPNAME: "
    if [ -f $PIDFILE ]; then
        PID=`cat $PIDFILE`
        echo $APPNAME already running: $PID
        exit 2;
    fi
    
    cd $APPDIR
    daemon $COMMAND $SCRIPT $OPTIONS 2>/dev/null
    RETVAL=$?
    
    if [ $RETVAL ]; then
        echo_success
    else
        echo_failure
    fi
    echo
}

stop() {
    echo -n "Stopping $APPNAME: "
    
    killproc $APPNAME 2>/dev/null
    echo
}

case "$1" in
    start)
        start
    ;;
    stop)
        stop
    ;;
    restart)
        stop
        start
    ;;
    status)
        status $APPNAME
        RETVAL=$?
    ;;
    *)
        echo "Usage: {start|stop|restart|status}"
        exit 1
esac

exit $RETVAL
