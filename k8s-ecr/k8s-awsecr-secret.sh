# Generate a valid secret key to be used by kubernetes pods/jobs so that we can do a pull from a AWS ECR repository

EMAIL=									# Our email address
AWS_ACCOUNT_ID=							# AWS Account ID
AWS_REGION="eu-west-1"					# AWS Region where the ECR repository is placed
AWS_PROFILE="default"					# Profile to be used
SECRET_KEY_NAME="aws-ecr-credentials"	# Name of the secret to be created

kubectl create secret docker-registry $SECRET_KEY_NAME --docker-server=https://$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com --docker-username=AWS --docker-password="$(aws ecr get-login --no-include-email --profile $AWS_PROFILE --registry-ids $AWS_ACCOUNT_ID | cut -d' ' -f6)" --docker-email=$EMAIL
kubectl patch serviceaccount default -p '{"imagePullSecrets":[{"name":"$SECRET_KEY_NAME"}]}'
