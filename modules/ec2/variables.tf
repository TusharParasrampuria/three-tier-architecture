variable "instance_count" {
  type = number
}
variable "instance_type" {
  type = string
}
variable "root_volume_size" {
  type        = number
  description = "root volume in gb"
}
variable "root_storage_type" {
  type = string
}
variable "encrypt_volume" {
  type = bool
}
variable "vpc_id" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "subnet_cidrs" {
  type = list(string)
}
variable "instance_name" {
  type = string
}
variable "rt_id" {
  type = string
}
variable "azs" {
  type = list(string)
}
variable "launch_template_name" {
  type = string
}
variable "ssh_key_name" {
  type = string
}
variable "sg_name" {
  type = string
}
variable "vpc_cidr_block" {
  type = list(string)
}