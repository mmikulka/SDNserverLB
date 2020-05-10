#!/bin/bash

startOld() {
    echo "Start service for" + $1
    python ./old/webservice.py $1
}

startNew() {
    echo "Start service for" + $1
    python ./new/webservice.py
}

if [ "$1" == "start" ]
then
	startOld $2
elif [ "$1" == "update" ]
then
	startNew $2
else 
    echo "Sample call"
    echo " ./startWeb.sh start h1"
    echo "Basic Command:"
	echo " start:   start old version"
	echo " update:  start new version"
    
if