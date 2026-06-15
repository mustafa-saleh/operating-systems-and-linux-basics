#!/bin/bash

apt update
NEW_USER="nodeapp"

echo "install node, npm, curl, wget, net-tools"
apt install -y nodejs npm curl wget net-tools
sleep 10

echo "checking node and npm versions..."

node_version=$(node -v 2>&1 | grep "v" | awk '{print substr($1,2)}')
npm_version=$(npm -v 2>&1)

echo "Node.js version: $node_version"
echo "npm version: $npm_version"

# set the log directory
echo -n "set the log directory: "
read log_dir
if [ -d "$log_dir" ]; then
	echo "Log directory exists: $log_dir"
else
	echo "Log directory does not exist. Creating it..."
	mkdir -p "$log_dir"
fi

# create a new user and set ownership of the log directory
useradd $NEW_USER -m
chown $NEW_USER -R $log_dir

app_url="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"

runuser -l $NEW_USER -c "curl -o node_app.tgz $app_url"
runuser -l $NEW_USER -c "tar -xvzf node_app.tgz"

runuser -l $NEW_USER -c "
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret
export LOG_DIR=$log_dir
cd package
npm install
node server.js &"
# node server.js > $log_dir/server.log 2>&1 &"

# display that nodejs process is running
ps aux | grep node | grep -v grep

# display that nodejs is running on port 3000
netstat -ltnp | grep :3000
