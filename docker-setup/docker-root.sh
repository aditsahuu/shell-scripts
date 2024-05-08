#!/bin/bash

# Exit on any error
set -e

# Update Packages
echo "Updating system packages..."
sudo apt update

# Installing packages
echo "Installing required packages..."
sudo apt install -y uidmap curl

# Download and install Docker
echo "Downloading and installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Download and install Docker Rootless
echo "Downloading and installing Docker Rootless..."
curl -fsSL https://get.docker.com/rootless -o get-docker-rootless.sh
sh get-docker-rootless.sh

# Set environment variables
echo "Setting environment variables..."
export PATH=/usr/bin:$PATH 
export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

# Source .bashrc to update environment
echo "Sourcing .bashrc to update environment..."
source ~/.bashrc

# Start Docker service
echo "Starting Docker service..."
systemctl --user start docker

# Enable Docker service to start at boot
echo "Enabling Docker service to start on boot..."
systemctl --user enable docker

echo "Docker installation and setup complete!"