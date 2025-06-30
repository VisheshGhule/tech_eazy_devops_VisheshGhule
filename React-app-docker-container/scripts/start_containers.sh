#!/bin/bash
cd $(dirname "$0")/..
echo "Starting containers..."
docker-compose up -d 