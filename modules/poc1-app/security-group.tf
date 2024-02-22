resource "aws_security_group" "allow_tls" {
  # Use variable for security group name for flexibility.
  name        = var.sg_name
  description = "Allow TLS inbound and outbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  # Dynamic block for ingress rules based on variable input.
  dynamic "ingress" {
    for_each = var.sg_ports_ingress
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.sg_protocol
      cidr_blocks = [data.aws_vpc.selected.cidr_block] # Reference to VPC's CIDR block for the source.
    }
  }

  # Dynamic block for egress rules similar to ingress.
  dynamic "egress" {
    for_each = var.sg_ports_egress
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.sg_protocol                    # Ensuring consistency in variable naming.
      cidr_blocks = [data.aws_vpc.selected.cidr_block] # Using VPC CIDR block for the destination.
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

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  tags = {
    Name = "alb-sg-private-subnet-${var.environment}" # Tagging with environment for clear resource segregation.
  }
}
