@echo off
echo Deleting existing resources...

echo Deleting DynamoDB tables...
aws dynamodb delete-table --table-name PetsTable
aws dynamodb delete-table --table-name AdoptionsTable
aws dynamodb delete-table --table-name PetsInterestTable

echo Waiting for tables to be deleted...
timeout /t 10

echo Deleting Cognito User Pool Domain...
aws cognito-idp delete-user-pool-domain --domain pets-app-user-pool-473316329834-ah --user-pool-id us-east-1_UyDHmoZVL

echo Deleting Cognito User Pool...
aws cognito-idp delete-user-pool --user-pool-id us-east-1_UyDHmoZVL

echo Deleting SNS Topic...
aws sns delete-topic --topic-arn arn:aws:sns:us-east-1:473316329834:EmailReport

echo Cleanup complete! Now run: sam build && sam deploy
