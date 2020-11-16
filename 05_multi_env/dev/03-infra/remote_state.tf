data "terraform_remote_state" "app" {
  backend = "s3"

  config = {
    bucket = "test-tf-state-bucket-1"
    key    = "app.tfstate"
  }
}
