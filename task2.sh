#!/bin/bash
#-----------------------------------------------------------
if [ -n "$1" ]
then
	path="$1"
	echo "Path:" $path
	
	cd $path
	Directories=$(ls -l | tr -s ' ' '\t' | cut -f '3' | sort -u)
	for i in $Directories; do
		mkdir -p $i
	done
	
	DirAndFile=$(ls -l | tr -s ' ' '\t' | cut -f '3 9')
	step=0
	for elem in $DirAndFile; do
 		step=$((step+1))
		if (($step%2))
			then
				Directories=$elem				
			else
				if [ -f ./$elem ]
					then
					cp ./$elem ./$Directories/$elem
				fi
		fi
	done
else
	echo "No argument"	
fi
