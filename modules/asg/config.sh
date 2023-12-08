#!/bin/bash

# Set Variables for Ubuntu
PACKAGE="apache2 wget unzip"
SVC="apache2"


echo "Running Setup on Ubuntu"
# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo apt update
sudo apt install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo
