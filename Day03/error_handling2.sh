#!/bin/bash

# this is function
create_directory() {
        mkdir demo
}


# call function here
if ! create_directory; then
	echo "the code is being exited as the directory already exists"
	exit 1
fi	

# display on screen
echo "this should not work because the code is interrupted"

