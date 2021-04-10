source $WORKSPACE/var.sh
if [[ $stackname == *"iam"* ]] || [[ $stackname == *"IAM"* ]]
then
aws s3 cp $WORKSPACE/iam.json s3://cft-rama/$stackname.json
else
aws s3 cp $WORKSPACE/demo.json s3://cft-rama/$stackname.json
fi

