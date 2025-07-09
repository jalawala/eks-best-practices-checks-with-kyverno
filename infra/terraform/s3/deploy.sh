#!/bin/bash

# S3 Bucket Deployment Script
# This script initializes and deploys the S3 bucket using Terraform

set -e

echo "🚀 Starting S3 Bucket Deployment..."

# Change to the script directory
cd "$(dirname "$0")"

# Check if terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "❌ Terraform is not installed. Please install Terraform first."
    exit 1
fi

# Check if AWS CLI is configured
if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ AWS CLI is not configured or credentials are invalid."
    echo "Please run 'aws configure' or set up your AWS credentials."
    exit 1
fi

echo "✅ Prerequisites check passed"

# Initialize Terraform
echo "📦 Initializing Terraform..."
terraform init

# Validate configuration
echo "🔍 Validating Terraform configuration..."
terraform validate

# Plan deployment
echo "📋 Planning deployment..."
terraform plan -out=tfplan

# Ask for confirmation
read -p "🤔 Do you want to apply this plan? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 Applying Terraform configuration..."
    terraform apply tfplan
    
    echo "✅ Deployment completed successfully!"
    echo "📊 Outputs:"
    terraform output
    
    # Clean up plan file
    rm -f tfplan
else
    echo "❌ Deployment cancelled."
    rm -f tfplan
    exit 1
fi

echo "🎉 S3 bucket deployment completed!"
