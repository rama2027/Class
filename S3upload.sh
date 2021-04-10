source $WORKSPACE/var.sh
if [[ $stackname == *"iam"* ]] || [[ $stackname == *"IAM"* ]]
then
echo "Uploading IAM Template"
aws s3 cp $WORKSPACE/iam.json s3://cft-rama/$stackname.json
else
echo "Uploading CFT Teamplate"
aws s3 cp $WORKSPACE/demo.json s3://cft-rama/$stackname.json
fi

