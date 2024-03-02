output "instance_public_ips" {
  value = aws_instance.instance.*.public_ip
}
output "instance_private_ips" {
  value = aws_instance.instance.*.private_ip
}
output "sg_id" {
  value = aws_security_group.sg.id
}