resource "aws_security_group_rule" "ingress-5000" {
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["${data.terraform_remote_state.frontend.outputs.frontend-server.instance_public_ips[0]}/32"]
  security_group_id = module.backend-server.sg_id
  description       = "ingress from frontend to backend"
}

resource "aws_security_group_rule" "ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.frontend.outputs.frontend-server.sg_id
  security_group_id        = module.backend-server.sg_id
  description              = "SSH from frontend to backend"
}