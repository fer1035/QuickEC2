resource "aws_security_group" "security_group" {
  description = var.sg_description
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress_self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  self              = true
  security_group_id = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "ingress_security_group" {
  count                    = var.for_sg ? 1 : 0
  type                     = "ingress"
  from_port                = var.ingress_from
  to_port                  = var.ingress_to
  protocol                 = var.ingress_protocol
  source_security_group_id = var.ingress_source_sg_id
  security_group_id        = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "ingress_ip" {
  count     = var.for_ip ? 1 : 0
  type      = "ingress"
  from_port = var.ingress_from
  to_port   = var.ingress_to
  protocol  = var.ingress_protocol
  cidr_blocks = [
    var.ingress_cidr
  ]
  ipv6_cidr_blocks = [
    var.ingress_cidr_ipv6
  ]
  security_group_id = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "egress_self" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  self              = true
  security_group_id = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "egress_security_group" {
  count                    = var.for_sg ? 1 : 0
  type                     = "egress"
  from_port                = var.egress_from
  to_port                  = var.egress_to
  protocol                 = var.egress_protocol
  source_security_group_id = var.egress_source_sg_id
  security_group_id        = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "egress_ip" {
  count     = var.for_ip ? 1 : 0
  type      = "egress"
  from_port = var.egress_from
  to_port   = var.egress_to
  protocol  = var.egress_protocol
  cidr_blocks = [
    var.egress_cidr
  ]
  ipv6_cidr_blocks = [
    var.egress_cidr_ipv6
  ]
  security_group_id = aws_security_group.security_group.id
}
