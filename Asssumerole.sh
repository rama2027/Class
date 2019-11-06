 #!/bin/sh
aws sts assume-role --role-arn $IAM_ROLE --role-session-name DescribeInstance > ram.txt
cat ram.txt
grep -o 'AccessKeyId[^"]*' ram.txt
