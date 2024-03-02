resource "aws_security_group_rule" "ingress-3306" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.backend.outputs.backend-server.sg_id
  security_group_id        = module.db-server.sg_id
  description              = "ingress from backend to db"
}

resource "aws_security_group_rule" "ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.frontend.outputs.frontend-server.sg_id
  security_group_id        = module.db-server.sg_id
  description              = "SSH from frontend to db"
}
