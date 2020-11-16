output "tf_bucket_id" {
  value       = module.remote_state.tf_state_bucket.id
  description = "Terraform bucket ID"
}
