#!/bin/sh


	if [ $# -eq 0 ]; then
		docker-compose up -d
		exit;	
	fi	

	compfile=conf/$1/docker-compose.yml
			
	if [ -z $2 ] ; then
		cmd="up -d" 
	elif [ $2 == "start" ]; then	
		cmd="up -d"
	else
		cmd=$2	
	fi	

	echo "config '$compfile' $cmd ..." >&2
	docker-compose -f docker-compose.yml -f $compfile $cmd