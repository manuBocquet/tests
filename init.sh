#!/bin/bash

GITURL="https://github.com/manuBocquet/tests.git"

cleanup ()                                                                 
{ 
  echo
  echo "Catch CTRL-C"
  kill -s SIGTERM $!                                                         
  exit 0                                                                     
}     

if [[ ! -f "/opt/app/src/main.py" ]]; then
	echo "Clone $GITURL"
	git clone $GITURL /opt/app
else
	echo "Update repo $GITURL"
	cd /opt/app
	git fetch --all origin master
	git reset --hard origin master
fi

if [[ -e "/opt/app/src/main.py" ]]; then
	echo "Launch service"
	cd /opt/app/src
	uvicorn main:app --reload
else 
	echo "Wait for exit"
	trap cleanup SIGINT SIGTERM                                                
                                                                           
	while [ 1 ]                                                                
	do                                                                         
  		sleep 10 & 
  		wait $!                                                                
  		echo "continue"                                                            
	done	
fi
