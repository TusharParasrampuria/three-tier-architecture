resource "aws_subnet" "subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.subnet_cidrs, count.index)
  availability_zone = element(var.azs, (count.index) % length(var.azs))

  tags = {
    Name = "${var.subnet_name}-${count.index + 1}"
  }
}

resource "aws_route_table_association" "rt_association" {
  count          = length(var.subnet_cidrs)
  subnet_id      = element(aws_subnet.subnets[*].id, count.index)
  route_table_id = aws_route_table.rt-public.id
}