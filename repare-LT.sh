#!/bin/bash

wget -q -T 1 localhost:8081/Languages

if [ $? -ne 0 ]; then
	rm -f Languages

	cd /opt/languagetool

	# language-tool is not responding. let's restart it
	echo -e `date +"%Y-%m-%d %H:%M:%S"`" Service Test: FAILED: Restarting LT" >> /tmp/lt.log

	LT=`ps aux | grep [l]anguagetool | awk '{print $2}'`

	if [ -n "$LT" ]; then

		kill -9 $LT
		echo -e `date +"%Y-%m-%d %H:%M:%S"`" Service killed" >> /tmp/lt.log
	fi
	
	./run-LT.sh
	
	echo ""
	echo -e `date +"%Y-%m-%d %H:%M:%S"`" LT RESTARTED" >> /tmp/lt.log

else
	echo -e `date +"%Y-%m-%d %H:%M:%S"`" Service Test: OK" >> /tmp/lt.log
	rm Languages
fi




