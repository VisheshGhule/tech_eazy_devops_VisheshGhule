#!/bin/bash
set -e

# Logging to file and syslog
exec > >(tee /var/log/deploy.log | logger -t deploy-script) 2>&1

# Get inputs
STAGE=$1
BUCKET_NAME=$2

if [ -z "$STAGE" ] || [ -z "$BUCKET_NAME" ]; then
  echo "Usage: ./deploy.sh <Dev|Prod> <s3-bucket-name>"
  exit 1
fi

# Convert stage to lowercase to match config file
CONFIG_FILE="${STAGE,,}_config"

# Load environment-specific config
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Config file $CONFIG_FILE not found!"
  exit 1
fi

source "$CONFIG_FILE"

# Update and install required packages on Ubuntu
sudo apt update -y
sudo apt install -y openjdk-21-jdk git maven awscli at

# Enable atd service if not running (used for shutdown)
sudo systemctl enable --now atd

# Clone the repo if not already present
if [ ! -d "$REPO_NAME" ]; then
  git clone "$REPO_URL"
fi

cd "$REPO_NAME"

# Give permissions
sudo chown -R $USER:$USER .
chmod +x mvnw

# Build the project
./mvnw clean package

# Run the JAR if it exists
JAR_PATH="target/techeazy-devops-0.0.1-SNAPSHOT.jar"
if [ -f "$JAR_PATH" ]; then
  echo "Running application..."
  nohup java -jar "$JAR_PATH" --server.port=80 > /home/ubuntu/app.log 2>&1 &
else
  echo "Build failed. JAR not found."
  exit 1
fi

# Upload logs to S3
aws s3 cp /home/ubuntu/app.log s3://${BUCKET_NAME}/app.log
aws s3 cp /var/log/cloud-init.log s3://${BUCKET_NAME}/cloud-init.log || true

# Shutdown in 15 minutes
echo "sudo shutdown -h now" | at now + 15 minutes
