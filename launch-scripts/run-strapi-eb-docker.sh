#!/bin/bash
# cd /c/Stuff/Workspace/hfmd-cms

environment="local"
directory=$(pwd)

echo "Running eb docker for: $environment"
echo "Working directory: $directory"

source /c/Stuff/Workspace/python/envs/aws/Scripts/Activate
eb local setenv `cat ./launch-scripts/env/$environment.env | sed '/^#/ d' | sed '/^$/ d'`
winpty eb local run --port 1337
echo 'Done.'
read