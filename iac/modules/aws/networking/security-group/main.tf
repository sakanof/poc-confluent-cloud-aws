resource "aws_security_group" "sg" {
  name      = var.name
  vpc_id    = var.vpc_id

  ingress {
    cidr_blocks = var.ingress_cidr
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
  }

  egress {
    cidr_blocks = var.egress_cidr
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
 }
}
