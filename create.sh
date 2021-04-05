#!/bin/sh

source $WORKSPACE/var.sh

export stackname=my-new-stack
checkstack=$(aws --region $Region cloudformation describe-stacks --stack-name $stackname --query 'Stacks[0].StackName' --output text)
echo $checkstack
if [[ $checkstack != $stackname ]]
then
echo "stack $stackname not exists hence creating it"
aws cloudformation create-stack --stack-name $stackname --template-url http://s3.amazonaws.com/cft-rama/cft.json --stack-name $stackname --region $Region
if [[ $? -eq 0 ]]
then
    # Wait for create-stack to finish
    echo  "Waiting for create-stack command to complete"
    CREATE_STACK_STATUS=$(aws --region $Region cloudformation describe-stacks --stack-name $stackname --query 'Stacks[0].StackStatus' --output text)
    while [[ $CREATE_STACK_STATUS == "REVIEW_IN_PROGRESS" ]] || [[ $CREATE_STACK_STATUS == "CREATE_IN_PROGRESS" ]]
    do
        # Wait 30 seconds and then check stack status again
        sleep 30
        CREATE_STACK_STATUS=$(aws --region $Region cloudformation describe-stacks --stack-name $stackname --query 'Stacks[0].StackStatus' --output text)
    done
fi
else
echo "checking change set"
aws cloudformation create-change-set --stack-name $stackname --change-set-name my-change-set --template-url http://s3.amazonaws.com/cft-rama/cft.json --change-set-type UPDATE --region $Region
aws cloudformation wait change-set-create-complete --stack-name $stackname --change-set-name my-change-set --region $Region
changeid=$(aws cloudformation list-change-sets --stack-name $stackname --region $Region --output text)
if [[ $changeid == *"didn't contain changes"* ]]
then
echo "no change set is there hence deleting the stack"
aws cloudformation delete-stack --stack-name $stackname --region $Region
aws cloudformation wait stack-delete-complete --stack-name $stackname --region $Region
else
echo "change set is there executing it"
aws cloudformation execute-change-set --change-set-name my-change-set --stack-name $stackname --region $Region
aws cloudformation wait stack-update-complete --stack-name $stackname --region $Region
fi
fi
#aws cloudformation wait stack-create-complete --stack-name $stackname --region $Region
