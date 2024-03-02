variable "vpc_cidr_block" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "enable_dns_hostnames" {
  type = bool
}
variable "enable_dns_support" {
  type = bool
}
variable "igw_name" {
  type = string
}
variable "public_rt_name" {
  type = string
}
variable "private_rt_name" {
  type = string
}
variable "eip_name" {
  type = string
}
variable "nat_name" {
  type = string
}
variable "subnet_cidrs" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
variable "subnet_name" {
  type = string
}