#!/bin/bash


# and this is function definition

function is_girl() {

read -p "Enter the name of girl : " girl
read -p "love percentage % : " love

if [[ $girl == "sita" ]];
then
        echo "this is that girl"
elif [[ $love -ge 100 ]];
then
        echo "this is true love for sita"       
else
        echo "this is not that girl"    
fi
}


# call function here
is_girl
