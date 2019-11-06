aws sts assume-role --role-arn $IAM_ROLE --role-session-name s3-access-example > ram.txt
cat ram.txt
