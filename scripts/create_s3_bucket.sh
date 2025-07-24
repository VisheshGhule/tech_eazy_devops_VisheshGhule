#!/bin/bash

BUCKET_NAME=$1
REGION="us-west-2" 

if [ -z "$BUCKET_NAME" ]; then
  echo "❌ Error: Bucket name is required"
  echo "Usage: ./create_s3_bucket.sh <bucket-name>"
  exit 1
fi

echo "⏳ Creating bucket '$BUCKET_NAME' in region '$REGION'..."

# Create bucket
if [ "$REGION" == "us-east-1" ]; then
  aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$REGION"
else
  aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$REGION" \
    --create-bucket-configuration LocationConstraint="$REGION"
fi

echo "✅ Bucket '$BUCKET_NAME' created successfully and is private by default"

