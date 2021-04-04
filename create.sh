#!/bin/sh

source $WORKSPACE/var.sh
aws cloudformation deploy --template-file https://s3.amazonaws.com/cft-rama/cft.json --stack-name my-new-stack
