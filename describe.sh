 #!/bin/sh
. ..$WORKSPACE/var.sh
aws ec2 describe-instances --instance-ids $DESCRIBE_INSTANCE --region $Region
