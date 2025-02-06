#!/bin/bash

# Update packages
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Setup Docker permissions
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp - docker

# Pull Squid image and run container
docker pull ubuntu/squid:5.2-22.04_beta
docker run -d --name squid-container -e TZ=UTC -p 3128:3128 ubuntu/squid:5.2-22.04_beta
