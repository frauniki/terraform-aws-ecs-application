module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name   = "${var.name}-${var.environment}"
  vpc_id = var.vpc_id

  ingress_with_source_security_group_id = [{
    from_port                = var.listen_port
    to_port                  = var.listen_port
    protocol                 = "tcp"
    source_security_group_id = var.ingress_source_security_group_id
  }]
  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}
