#!/bin/bash

<< comment 
this programm is example of conditional statement
comment

read -p "Enter the name of girl : " girl

if [[ $girl == "sita" ]];
then	
	echo "this is that girl"
else
        echo "this is not that girl"	
fi


