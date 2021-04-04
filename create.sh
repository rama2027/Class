#!/bin/sh

source $WORKSPACE/var.sh
export stackname=my-new-stack
aws cloudformation create-stack --stack-name myteststack --template-url http://s3.amazonaws.com/cft-rama/cft.json --stack-name $stackname --region $Region
aws cloudformation wait stack-create-complete --stack-name $stackname --region $Region

