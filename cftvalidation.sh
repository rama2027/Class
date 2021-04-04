#!/bin/sh

validation=$(aws cloudformation validate-template --template-url https://s3.amazonaws.com/arn:aws:s3:::cft-rama/cft.json)
if [ $? -eq 0]
then
{
echo "validation is ok"
}
else
{
echo "validation is not ok"
}
