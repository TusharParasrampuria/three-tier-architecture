data "terraform_remote_state" "frontend" {
  backend = "s3"
  config = {
    bucket  = "project-terraform-state-test"
    key     = "frontend.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}