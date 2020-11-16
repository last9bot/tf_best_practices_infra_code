output "tf_bucket_id" {
  description = "Terraform state bucket ID"
  value       = module.remote_state.tf_state_bucket.id
}
