 #!/bin/sh
$credentails=aws sts assume-role --role-arn $IAM_ROLE --role-session-name DescribeInstance
echo $credentails

