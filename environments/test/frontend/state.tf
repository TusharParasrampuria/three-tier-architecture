terraform {
  backend "s3" {
    key = "frontend.tfstate"
  }
}