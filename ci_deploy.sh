#!/usr/bin/env bash
set -e
image=node_deployer
docker build . -t $image -f Dockerfile.deploy 
app_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
docker run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e ENVIRONMENT=$ENVIRONMENT \
  $image /bin/sh -c '/bin/sh -c "lerna run deploy_sqs && lerna run deploy_worker && lerna run deploy_ec2"'

