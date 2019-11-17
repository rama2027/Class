source $WORKSPACE/var.sh
aws cloudformation create-stack --stack-name myteststack --template-url file:http://s3.amazonaws.com/cf-templates-i6z3lkvgdo6f-eu-west-1/create.yaml --region eu-west-1
