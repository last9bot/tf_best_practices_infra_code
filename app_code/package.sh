#!/bin/bash

set -e

usage="$0 lambda_function_file"

if [[ $# -ne 1 ]]; then
  echo "ERROR: Invalid usage"
  echo "$usage"
  exit 1
fi

lambda_function_file=$1

if ! [[ -f $lambda_function_file ]]; then
  echo "ERROR: Invalid uage. File $lambda_function_file does not exist"
  echo "$usage"
  exit 1
fi

lambda_function_zip="${lambda_function_file%.*}.zip"

virtual_env_dir="$(pwd)/venv"

echo "Using virtualenv: $virtual_env_dir"

# Backup already existing artifact
if [[ -f $lambda_function_zip ]]; then
  mv $lambda_function_zip $lambda_function_zip.bkp
fi

# Add virtualenv libs in new zip file
working_dir=$(pwd)
package_dir="$virtual_env_dir/lib/python3.7/site-packages"

cd $package_dir && zip -r9 -X $lambda_function_zip *
mv $package_dir/$lambda_function_zip $working_dir
cd $working_dir && zip -r9 -X $lambda_function_zip $lambda_function_file
