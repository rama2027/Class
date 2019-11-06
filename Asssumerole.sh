 #!/bin/sh
aws sts assume-role --role-arn $IAM_ROLE --role-session-name DescribeInstance > ram1.txt
cat ram1.txt
key=awk '/AccessKeyId/ {print $2}' ram1.txt
echo $key
