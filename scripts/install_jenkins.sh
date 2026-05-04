#!/bin/bash

set -e

sudo apt update -y
sudo apt install -y openjdk-21-jdk wget gnupg2

# Jenkins repo
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install -y jenkins

sudo systemctl enable jenkins
sudo systemctl start jenkins
