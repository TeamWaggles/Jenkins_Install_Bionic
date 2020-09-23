#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

echo "Adding Jenkins package to apt-keys"
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

echo "Updating apt-get"
sudo apt-get -qq update


echo "Installing Java 8 "
sudo apt-get -y install openjdk-8-jre  


echo "Install and start Jenkins"
sudo apt-get -y install jenkins 
sudo sed -e "s/^HTTP_PORT=8080/HTTP_PORT=8000/" -i.bak /etc/default/jenkins
sudo service jenkins restart

echo "Packages are being configured. Please wait."

sleep 1m



echo "Initial administrator password:"
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo $JENKINSPWD
