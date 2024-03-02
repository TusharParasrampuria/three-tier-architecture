output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_rt_id" {
  value = aws_route_table.rt-private.id
}

output "public_rt_id" {
  value = aws_route_table.rt-public.id
}

output "eip_id" {
  value = aws_eip.eip.id
}
