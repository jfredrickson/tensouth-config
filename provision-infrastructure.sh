#!/bin/bash

pushd infrastructure

terraform apply

BACKUPS_USER_ID=`terraform output backups_user_id`
BACKUPS_USER_SECRET=`terraform output backups_user_secret`
BACKUPS_S3_BUCKET=`terraform output backups_s3_bucket`

echo "backups_s3_bucket: $BACKUPS_S3_BUCKET" >> ../configuration/aws.yml
echo "backups_aws_access_key_id: $BACKUPS_USER_ID" >> ../configuration/aws.yml
echo "backups_aws_secret_access_key: $BACKUPS_USER_SECRET" >> ../configuration/aws.yml

popd
