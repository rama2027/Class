source $WORKSPACE/var.sh
aws cloudformation create-stack --stack-name myteststack --template-body file://s3.amazonaws.com/cf-templates-i6z3lkvgdo6f-eu-west-1/create.yaml --parameters ParameterKey=KeyPairName,ParameterValue=test ParameterKey=SubnetIDs,ParameterValue=Default
