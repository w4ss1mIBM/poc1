# --------------------------
# AWS Backend Configuration
# --------------------------
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

# variable "bucket_name" {
#   description = "S3 bucket for storing Terraform state files."
#   type        = string
#   default     = "wsl-backend-terraform-tfstate-${var.environment}"
# }

# variable "db_table_name" {
#   description = "DynamoDB table for Terraform state lock."
#   type        = string
#   default     = "wsl-terraform-state-locking-${var.environment}"
# }

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., prod, dev, staging)."
  default     = "int"
}



# --------------------------
# Networking Configuration
# --------------------------
variable "selected_vpc_name" {
  description = "Name of the VPC for deployment."
  type        = string
  default     = "private-vpc"
}

variable "app_subnet" {
  description = "Subnet for application servers."
  type        = string
  default     = "private-subnet-0"
}

variable "alb_subnet" {
  description = "Subnet for the Application Load Balancer."
  type        = string
  default     = "private-subnet-1"
}

# --------------------------
# EC2 Application Configuration
# --------------------------
variable "windows_server_ami_name_pattern" {
  description = "Name pattern to identify the Windows AMI."
  type        = string
  default     = "FRESH-AMI-*"
}

variable "ami_owner" {
  description = "Owner ID of the AMI"
  type        = string
  default     = "694493444487"
}


variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the AWS key pair for EC2 instances."
  type        = string
  default     = "key-playground"
}

variable "instance_name_prefix" {
  description = "Prefix for instance names to help with identifying resources."
  type        = string
  default     = "EC2-WEBAPP"
}

variable "cpu_credits" {
  description = "CPU credit option for burstable performance instances."
  type        = string
  default     = "unlimited"
}

variable "root_volume_size" {
  description = "Root volume size in GiB."
  type        = number
  default     = 40
}

variable "ebs_size" {
  description = "The size of the EBS volume in GiB."
  type        = number
  default     = 40
}

variable "ebs_device_name" {
  description = "The device name to attach the EBS volume to."
  type        = string
  default     = "/dev/sdh"
}

# --------------------------
# Security Group Configuration
# --------------------------
variable "sg_name" {
  description = "The name of the security group."
  type        = string
  default     = "app-sg"
}
variable "sg_ingress_ports" {
  description = "List of ingress ports and CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["192.168.1.0/24"]
    }
  ]

}

variable "sg_egress_ports" {
  description = "List of egress ports and CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["192.168.1.0/24"]
    }
  ]

}

variable "sg_ports_egress" {
  description = "List of egress ports for the security group."
  type        = list(number)
  default     = [80, 443]
}

variable "sg_protocol" {
  description = "Protocol for the security group rules."
  type        = string
  default     = "tcp"
}


# --------------------------
# ALB Configuration
# --------------------------

variable "ssl_policy" {
  description = "The SSL policy to use for HTTPS listeners"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}
variable "client_id" {
  description = "OIDC client ID"
  type        = string
}

variable "client_secret" {
  description = "OIDC client secret"
  type        = string
}
variable "oidc_settings" {
  description = "OIDC authentication settings"
  type = object({
    authorization_endpoint     = string
    issuer                     = string
    token_endpoint             = string
    user_info_endpoint         = string
    scope                      = string
    on_unauthenticated_request = string
  })
  default = {
    authorization_endpoint     = "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/authorize"
    issuer                     = "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x"
    token_endpoint             = "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/access_token"
    user_info_endpoint         = "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/userinfo"
    scope                      = "openid profile bmwids b2xroles"
    on_unauthenticated_request = "authenticate"
  }
}
variable "certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
  default     = "arn:aws:acm:eu-west-1:508072157138:certificate/b5ed352a-865f-49cd-bdf4-ed5abccc1b48"
}

variable "alb_ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks for ALB security group ingress."
  default     = ["127.0.0.1/32", "0.0.0.0/0"]

}
