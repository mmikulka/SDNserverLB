#!/bin/bash

declare -a fileList
fileList=(8000 8100 8200 8300 8400 8500)


install () {
	echo Deploying to ${fileList[@]}
	for des in ${fileList[@]}; do
		mkdir ../$des;
	done

	for des in ${fileList[@]}; do
		cp ./pipeline.py ../$des;
		cp ./config.json ../$des;
		mkdir ../$des/new
		cp ./newconfig.json ../$des/new;
		cp ./pipeline2.py ../$des/new;
	done
	echo Deployed
}

uninstall () {
	echo "Remove the service"
	pkill -f pipeline.py
	pkill -f pipeline2.py
	for des in ${fileList[@]}; do
		rm -r ../$des;
	done
	echo "Remove"
}

start () {
	echo "Start all instant"
	for des in ${fileList[@]}; do
		for i in {1..5}; do
			# echo $((des + i))
			python ../$des/pipeline.py $((des + i)) &
			echo start on port $((des + i))
		done
	done
	echo "Started all"
}

stop () {
	echo "Stop all instant"
	pkill -f pipeline.py
	pkill -f pipeline2.py
}


restart () {
	echo "Restart all instant"
	stop
	start
}

update () {
        name=${fileList[$1]}
        port=$(($name + $2))
        echo Update config at  $name
        echo No port $port

        pkill -f $port
        python ../$name/new/pipeline2.py $port &
}

updateall () {
	stop
        echo "Update all instant"
        for des in ${fileList[@]}; do
                for i in {1..5}; do
                        # echo $((des + i))
                        python ../$des/new/pipeline.py $((des + i)) &
                        echo update on port $((des + i))
                done
        done
}


if [ "$1" == "install" ]
then
	install
elif [ "$1" == "remove" ]
then
	uninstall
elif [ "$1" == "start" ]
then
	start
elif [ "$1" == "stop" ]
then
	stop
elif [ "$1" == "restart" ]
then
	restart
elif [ "$1" == "update" ]
then
	update $2 $3
elif [ "$1" == "updateall" ]
then
	updateall
else
	echo "Basic Command:"
	echo " install:   install the serve but not start"
	echo " remove:    remvoe the file from the server"
	echo " start:     start all instant"
	echo " stop:      stop all instant"
	echo " restart:   restart all instant"
	echo " update:    update single instant base on indexs"
	echo " updateall: update all instant"
fi
