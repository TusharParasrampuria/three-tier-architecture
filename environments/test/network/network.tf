data "aws_availability_zones" "azs" {
  state = "available"
}

module "network" {
  source               = "../../../modules/network"
  azs                  = data.aws_availability_zones.azs.names
  vpc_cidr_block       = element(var.vpc_cidr_block, 0)
  vpc_name             = "${var.common_prefix}-vpc-${var.env}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  igw_name             = "${var.common_prefix}-igw-${var.env}"
  public_rt_name       = "${var.common_prefix}-rt-public-${var.env}"
  private_rt_name      = "${var.common_prefix}-rt-private-${var.env}"
  nat_name             = "${var.common_prefix}-nat-${var.env}"
  eip_name             = "${var.common_prefix}-eip-${var.env}"
  subnet_cidrs         = [cidrsubnet(var.vpc_cidr_block[0], 8, 0)]
  subnet_name          = "${var.common_prefix}-public-subnet-${var.env}"
}

output "network" {
  value = module.network
}