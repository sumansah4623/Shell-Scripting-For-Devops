# this is shebang
#!/bin/bash
set -euo pipefail


#  this function is for checking installation of aws cli
check_awscli() {
	if ! command -v aws &> /dev/null; then
		echo "AWS CLI is not installed. please install it first." >&2
	return 1
        fi
}


# this function is for installing aws cli
install_awscli() {
	echo "Installing AWS CLI v2 on Linux..."

	# Download and install AWS CLI v2
	curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
       sudo apt-get install -y unzip &> /dev/null
       unzip -q awscliv2.zip
       sudo ./aws/install

       # Verify installation
       aws --version

       # Clean up
       rm -rf awscliv2 ./aws
}


# function for running instances
wait_for_instance() {
	local instance_id="$1"
	echo "waiting for instances $instance_id to be in running state..."

	while true; do
		state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservation[0].Instances[0].State.Name' --output text)
		if [[ "$state" == "running" ]]; then
			echo "Instance $instance_id is now running"
			break
		fi
	        sleep 10
	  done
  }  	  


