resource "aws_security_group" "this" {
  name        = local.security_group
  description = "Security Group for DocumentDB cluster"
  vpc_id      = var.vpc_id
  tags        = local.tags
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  description       = "Allow all egress traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "ingress_cidr_blocks" {
  type              = "ingress"
  description       = "Allow inbound traffic from CIDR blocks"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.this.cidr_block]
  security_group_id = aws_security_group.this.id
}