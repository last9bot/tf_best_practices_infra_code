module "remote_state" {
  source            = "git::https://github.com/saurabh-hirani/terraform-aws-state-mgmt.git?ref=v0.0.2"
  state_bucket_name = "test-tf-state-bucket-1"
  force_destroy     = true
  tags              = var.tags
}
