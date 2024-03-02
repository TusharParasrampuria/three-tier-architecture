data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket  = "project-terraform-state-test"
    key     = "network.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}