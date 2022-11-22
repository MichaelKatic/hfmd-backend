#!/bin/bash
# cd /c/Stuff/Workspace/hfmd-cms

environment="hfmd-cms-prod"
directory=$(pwd)

echo "Running deployment for environment: $environment"
echo "Working directory: $directory"

source /c/Stuff/Workspace/python/envs/aws/Scripts/Activate

eb use $environment
eb setenv `cat ./launch_scripts/env/$environment.env | sed '/^#/ d' | sed '/^$/ d'`
eb deploy

echo 'Done.'
read