#!/bin/bash
#-----------------------------------------------------------
if [ -n "$1" ]
then
	path="$1"
	echo "Path:" $path
	
	if ! [ -d $path ]; 
	then
		echo "No dir: " $path
	else
		rm $path*.bak
		rm $path*.tmp
		rm $path*.backup
	fi
else
	echo "No argument"	
fi
