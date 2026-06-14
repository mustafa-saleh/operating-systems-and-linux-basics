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