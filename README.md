# Operating Systems and Linux Basics

This project is for the DevOps Bootcamp Exercise for:

Operating Systems and Linux Basics - [DevOps Bootcamp](https://techworld-with-nana.teachable.com/p/devops-bootcamp)


## Ubuntu Docker Container

Get the latest image from docker hub [Ubuntu Docker Hub](https://hub.docker.com/_/ubuntu)

```bash
# pull the image
docker pull ubuntu:<tag>

# Run interactively with a shell
docker run -it ubuntu:<tag> bash

# add the container name 
docker run -it --name ubuntu-os ubuntu:<tag> bash

# remove container upon exit (auto cleanup after exit - great for one-off tasks)
docker run -it --rm --name ubuntu-os ubuntu:<tag> bash

# inside the container

# update packages
apt-get update

# optional additional tools 
apt-get install -y curl vim git

# check Ubuntu version
cat /etc/os-release

```

## Useful Commands

check the running contains, list images, ...etc

```bash
# List running containers
docker ps

# List all containers (including stopped)
docker ps -a

# Stop a container
docker stop <name>

# Remove a container
docker rm <name>

# List downloaded images
docker images
```

## Installation Script

Once the container is running, run the install script "install_java.sh"

```bash
#!/bin/bash

apt update
apt install -y default-jre

# 2>&1 the error output of the java -version command will be redirected to the standard output stream
# awk '{print substr($3,2,2)} takes the line from the previous output and grabs the third section of the string
# sample response of java -version:
# openjdk version "21.0.11" 2026-04-21
# OpenJDK Runtime Environment (build 21.0.11+10-1-24.04.2-Ubuntu)
# OpenJDK 64-Bit Server VM (build 21.0.11+10-1-24.04.2-Ubuntu, mixed mode, sharing)
java_version=$(java -version 2>&1 | grep "java version\|openjdk version" | awk '{print substr($3,2,2)}')

if [ "$java_version" == "" ]
then
    echo Installing Java has failed. No java version found	
elif [ "$java_version" == "1." ]
then
    echo An old version of Java installation found
elif [ "$java_version" -ge 11 ]
then
    echo Java version 11 or greater installed successfully
fi
```