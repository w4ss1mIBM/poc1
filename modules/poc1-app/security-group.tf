resource "aws_security_group" "ec2_security_group" {
  # Use variable for security group name for flexibility.
  name        = var.sg_name
  description = "Allow TLS inbound and outbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_ports
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${var.instance_name_prefix}-${var.sg_name}" # Dynamic naming based on variables.
  }
}

resource "aws_security_group" "alb_security_group" {
  # Simplified and corrected naming for clarity and consistency.
  name   = "alb-sg-private-${var.environment}" # Including environment in the name for differentiation.
  vpc_id = data.aws_vpc.selected.id
  
  dynamic "ingress" {
    for_each = var.alb_ingress_cidr_blocks
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.alb_egress_cidr_blocks
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  tags = {
    Name = "alb-sg-private-subnet-${var.environment}" # Tagging with environment for clear resource segregation.
  }
}