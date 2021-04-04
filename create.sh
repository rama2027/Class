#!/bin/sh

source $WORKSPACE/var.sh
aws cloudformation deploy --template-file file:s3://cft-rama/cft.json --stack-name my-new-stack --region $Region
