#!/bin/bash

apt update

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
if [ -d "$log_dir" ]
then
    echo "Log directory exists: $log_dir"
else
    echo "Log directory does not exist. Creating it..."
    mkdir -p "$log_dir"
fi

app_url="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"

curl -o node_app.tgz $app_url
tar -xvzf node_app.tgz
cd package

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

npm install
node server.js > $log_dir/server.log 2>&1 &

# display that nodejs process is running
ps aux | grep node | grep -v grep

# display that nodejs is running on port 3000
netstat -ltnp | grep :3000
