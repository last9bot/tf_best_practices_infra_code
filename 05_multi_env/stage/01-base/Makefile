.PHONY: all plan apply destroy

all: init plan apply

init:
	terraform init

plan:
	terraform plan -out tfplan

apply:
	terraform apply tfplan

output:
	terraform output -json

destroy:
	terraform destroy -auto-approve
