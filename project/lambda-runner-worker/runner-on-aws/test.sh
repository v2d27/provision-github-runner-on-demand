#!/bin/bash

# Wait docker installed
check_docker_installed() {
  if docker -v &>/dev/null; then
    echo "Docker is installed."
    return 0
  else
    echo "Docker is not installed."
    return 1
  fi
}

check_aws_cli_installed() {
  if aws --version &>/dev/null; then
    echo "AWS CLI is installed."
    return 0
  else
    echo "AWS CLI is not installed."
    return 1
  fi
}

# Loop to check both installations
while true; do
  docker_installed=false
  aws_installed=false

  # Check Docker
  check_docker_installed
  if [ $? -eq 0 ]; then
    docker_installed=true
  fi

  # Check AWS CLI
  check_aws_cli_installed
  if [ $? -eq 0 ]; then
    aws_installed=true
  fi

  # Exit loop if both are installed
  if $docker_installed && $aws_installed; then
    echo "Both Docker and AWS CLI are installed. Exiting loop."
    break
  fi

  echo "Retrying in 5 seconds..."
  sleep 5
done