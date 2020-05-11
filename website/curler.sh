#!/bin/bash

echo curl to $1/version

n=1
while [ $n -le 500 ]
do
	curl $1/version
	echo
	sleep 1
	n=$(( $n + 1 ))
done
