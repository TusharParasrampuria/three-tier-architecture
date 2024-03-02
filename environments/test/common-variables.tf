variable "env" {
  type    = string
  default = "test"
}
variable "common_prefix" {
  type    = string
  default = "project"
}
variable "vpc_cidr_block" {
  type    = list(string)
  default = ["10.10.0.0/16"]
}