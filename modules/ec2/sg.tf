resource "aws_security_group" "sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.sg_name}"
  }
}

resource "aws_security_group_rule" "egress-to-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
  description       = "egress all"
}