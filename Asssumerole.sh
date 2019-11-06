 #!/bin/sh
aws sts assume-role --role-arn $IAM_ROLE --role-session-name DescribeInstance --output json > Cred.json
jq -r '.["Credentials"]' Cred.json > Cred.txt
cat Cred.txt
export AWS_SECRET_ACCESS_KEY=$(awk '/SecretAccessKey/ {print $2}' Cred.txt | tr -d '",{}')
export AWS_SESSION_TOKEN=$(awk '/SessionToken/ {print $2}' Cred.txt | tr -d '",{}')
export AWS_ACCESS_KEY_ID=$(awk '/AccessKeyId/ {print $2}' Cred.txt | tr -d '",{}')
printenv
aws ec2 describe-instances --instance-ids $DESCRIBE_INSTANCE --region $Region
