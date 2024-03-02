data "terraform_remote_state" "backend" {
  backend = "s3"
  config = {
    bucket  = "project-terraform-state-test"
    key     = "backend.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}