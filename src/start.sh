#!/bin/sh

if [[ ! -d "/opt/app" ]]; then
	git clone https://github.com/manuBocquet/tests.git /opt/app
elif [[ -e "/opt/app/main.py" ]]; then
	cd /opt/app
	git fetch --all origin master
	git reset --hard origin master
fi

if [[ -e "/opt/app/main.py" ]]; then
	cd /opt/app
	uvicorn main:app --reload
fi
	
