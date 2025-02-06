#!/bin/bash

# Update packages
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Get current user reliably
CURRENT_USER=$(whoami)
if [ -z "$CURRENT_USER" ]; then
    echo "Error: Could not determine current user"
    exit 1
fi

# Setup Docker permissions
sudo usermod -aG docker $CURRENT_USER

# Pull Squid image and run container
docker pull ubuntu/squid:5.2-22.04_beta
docker run -d --name squid-container -e TZ=UTC -p 3128:3128 ubuntu/squid:5.2-22.04_beta
