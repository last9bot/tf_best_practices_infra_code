#!/bin/bash

set -e

aws s3 cp lambda.zip s3://test-tf-lambda-s3
