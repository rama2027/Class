source $WORKSPACE/var.sh
aws s3 cp $WORKSPACE/demo.json s3://cft-rama/$stackname.json
aws s3 cp $WORKSPACE/iam.json s3://cft-rama/$stackname.json

