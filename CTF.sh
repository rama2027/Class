source $WORKSPACE/var.sh
aws cloudformation create-stack --stack-name myteststack --template-body file://s3.amazonaws.com//cf-templates-i6z3lkvgdo6f-eu-west-1/test.txt --parameters ParameterKey=KeyPairName,ParameterValue=TestKey ParameterKey=SubnetIDs,ParameterValue=SubnetID1\\,SubnetID2
