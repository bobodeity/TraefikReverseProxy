#!/bin/sh

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

##########################
# Set up the repository  #
##########################

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
sudo apt-get update -y && \
sudo apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
  
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) 
# after the word stable in the commands below. Learn about nightly and test channels.
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

##########################
# Install Docker Engine  #
##########################

# Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version
sudo apt-get update -y && \
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

##########################
# Install Docker Compose #
##########################

sudo curl -s -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
