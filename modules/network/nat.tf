resource "aws_nat_gateway" "nat" {
  subnet_id     = aws_subnet.subnets[0].id
  allocation_id = aws_eip.eip.id
  tags = {
    Name = "${var.nat_name}"
  }
}
