#!/bin/bash

# Update packages
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Pull Squid image and run container
docker pull sameersbn/squid:latest
docker run -d -p 3128:3128 --name squid_proxy sameersbn/squid:latest