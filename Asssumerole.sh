 #!/bin/sh
aws sts assume-role --role-arn $IAM_ROLE --role-session-name DescribeInstance --output table > ram.txt
cat ram.txt
