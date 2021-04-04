#!/bin/sh

source $WORKSPACE/var.sh
validation=$(aws cloudformation validate-template --template-url https://s3.amazonaws.com/cft-rama/cft.json --region $Region)
if [ $? -eq 0 ] 
then
echo "validation is ok"
else
echo "validation is not ok"
fi
