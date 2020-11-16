#!/bin/bash

set -e

aws s3api delete-object --bucket test-tf-lambda-s3 --key lambda.zip
aws s3api delete-bucket --bucket test-tf-lambda-s3
