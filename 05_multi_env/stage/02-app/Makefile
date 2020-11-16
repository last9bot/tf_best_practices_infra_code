.PHONY: all plan apply destroy

all: init plan apply

init:
	terraform init -backend=true -backend-config="bucket=test-tf-state-bucket-1" -backend-config="key=app.tfstate"

plan:
	terraform plan -var-file ../../common/common.tfvars -var-file ../../common/lambda.tfvars -var-file input.tfvars -out tfplan

apply:
	terraform apply tfplan

output:
	terraform output -json

destroy:
	terraform destroy -auto-approve -var-file ../../common/common.tfvars -var-file ../../common/lambda.tfvars -var-file input.tfvars
