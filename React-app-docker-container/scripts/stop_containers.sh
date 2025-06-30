#!/bin/bash
cd $(dirname "$0")/..
echo "Stopping containers..."
docker-compose down 