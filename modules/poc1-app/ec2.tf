provider "aws" {
  region = var.region
}

# Fetch the latest Windows AMI based on provided criteria
data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.windows_server_ami_name_pattern] # Using a more descriptive variable name
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami_owner] # Using a variable makes it flexible to change owners
}

# Provision Windows EC2 instances
resource "aws_instance" "windows_ec2" {
  count                  = var.instance_count
  ami                    = data.aws_ami.windows.id
  instance_type          = var.instance_type
  key_name               = var.key_name # Assuming 'key_name' is defined in variables.tf
  subnet_id              = data.aws_subnet.app_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    volume_size = var.root_volume_size # Correcting a typo for consistency
  }

  tags = {
    Name = "${var.instance_name_prefix}-${count.index + 1}"
  }

  credit_specification {
    cpu_credits = var.cpu_credits # Allow configuration of CPU credits via variable
  }
}
