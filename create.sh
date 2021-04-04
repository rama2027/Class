#!/bin/sh

source $WORKSPACE/var.sh
aws cloudformation create-stack --stack-name myteststack --template-url http://s3.amazonaws.com/cft-rama/cft.json --stack-name my-new-stack --region $Region
