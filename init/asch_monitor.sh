#!/bin/bash
readonly PROG_DIR=$(readlink -m $(dirname $0))
acmed=$PROG_DIR/../acmed
log=$PROG_DIR/../logs/acme_monitor.log

function auto_restart(){
	status=`$acmed status`
	if [ "$status" == "Acme server is not running" ];then
		$acmed restart
		echo "`date +%F' '%H:%M:%S`[error]	Acme server is not running and restarted" >> $log
	else
		echo "`date +%F' '%H:%M:%S`[info]	Acme server is running" >> $log
	fi	
}

auto_restart
