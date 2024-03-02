data "aws_availability_zones" "azs" {
  state = "available"
}

module "db-server" {
  source               = "../../../modules/ec2"
  azs                  = data.aws_availability_zones.azs.names
  instance_count       = 1
  encrypt_volume       = true
  instance_name        = "${var.common_prefix}-db-${var.env}"
  instance_type        = "t3.micro"
  launch_template_name = "${var.common_prefix}-db-lt-${var.env}"
  root_storage_type    = "gp3"
  root_volume_size     = "8"
  rt_id                = data.terraform_remote_state.network.outputs.network.private_rt_id
  ssh_key_name         = "${var.common_prefix}-ssh-key-${var.env}"
  sg_name              = "${var.common_prefix}-db-sg-${var.env}"
  subnet_cidrs         = [cidrsubnet(var.vpc_cidr_block[0], 8, 3)]
  vpc_cidr_block       = var.vpc_cidr_block
  subnet_name          = "${var.common_prefix}-db-subnet-${var.env}"
  vpc_id               = data.terraform_remote_state.network.outputs.network.vpc_id

}

output "db-server" {
  value = module.db-server
}
