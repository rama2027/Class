 #!/bin/sh
 
sudo yum install jq -y
aws sts assume-role --role-arn $IAM_ROLE --role-session-name DescribeInstance --output json > Cred.json
jq -r '.["Credentials"]' Cred.json > Cred.txt
cat Cred.txt
awk '/SecretAccessKey/ {print $2}' Cred.txt | tr -d '",{}' > SecretAccessKey.txt
awk '/SessionToken/ {print $2}' Cred.txt | tr -d '",{}' > SessionToken.txt
awk '/AccessKeyId/ {print $2}' Cred.txt | tr -d '",{}' > AccessKeyId.txt
echo export AWS_SECRET_ACCESS_KEY=$(awk '/SecretAccessKey/ {print $2}' Cred.txt | tr -d '",{}') > var.sh
echo export AWS_SESSION_TOKEN=$(awk '/SessionToken/ {print $2}' Cred.txt | tr -d '",{}') > var.sh
echo export AWS_ACCESS_KEY_ID=$(awk '/AccessKeyId/ {print $2}' Cred.txt | tr -d '",{}') > var.sh
cat var.sh
printenv
