#!/bin/bash
environment="hfmd-cms-prod"
directory=$(pwd)

echo "Running deployment for environment: $environment"
echo "Working directory: $directory"

source /c/Stuff/Workspace/python/envs/aws/Scripts/Activate

eb use $environment

echo "Setting environment variables."
eb setenv `cat ./launch_scripts/env/$environment.env | sed '/^#/ d' | sed '/^$/ d'`

echo "Deploying to environment."
eb deploy

echo "Deploy complete. Printing logs."
eb logs

echo 'Done.'
read