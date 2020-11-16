module "remote_state" {
  source            = "git::https://github.com/saurabh-hirani/terraform-aws-state-mgmt.git?ref=v0.0.2"
  state_bucket_name = "test-tf-state-bucket-1"
  force_destroy     = true
  lock_table_name   = "test-tf-state-lock-table-1"
  tags              = var.tags
}
