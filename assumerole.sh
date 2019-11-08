 #!/bin/sh
aws sts assume-role --role-arn $IAM_ROLE --role-session-name DescribeInstance --output json > Cred.json
jq -r '.["Credentials"]' Cred.json > Cred.txt
cat Cred.txt
awk '/SecretAccessKey/ {print $2}' Cred.txt | tr -d '",{}' > SecretAccessKey.txt
awk '/SessionToken/ {print $2}' Cred.txt | tr -d '",{}' > SessionToken.txt
awk '/AccessKeyId/ {print $2}' Cred.txt | tr -d '",{}' > AccessKeyId.txt
export AWS_SECRET_ACCESS_KEY=$(awk '/SecretAccessKey/ {print $2}' Cred.txt | tr -d '",{}')
cat AccessKeyId.txt
cat SessionToken.txt
cat SecretAccessKey.txt
printenv
