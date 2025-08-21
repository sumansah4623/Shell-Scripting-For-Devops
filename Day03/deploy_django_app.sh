#!/bin/bash


<< task
Deploy a Django app
and handle the code for errors
task


# function for clone github project to your local system
code_clone() {
	echo "Cloning the Django app..."
	git clone https://github.com/LondheShubham153/django-notes-app.git

}



# function for installation of required librery
install_requirements() {
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y

}


# function for required restart
required_restarts() {
	sudo systemctl enable docker
	sudo systemctl enable nginx
}


# function for deployment
deploy() {
        docker build -t notes-app .
        docker run -d -p 8000:8000 notes-app:latest
}

echo "***************DEPLOYMENT STARTED*******************"

code_clone
install_requirements
required_restarts
deploy

echo "**************DEPLOYMENT DONE************************"

