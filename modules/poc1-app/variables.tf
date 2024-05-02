# --------------------------
# AWS Backend Configuration
# --------------------------

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., prod, dev, staging)."
}

# --------------------------
# Networking Configuration
# --------------------------


variable "selected_vpc_name" {
  description = "Name of the VPC for deployment."
  type        = string
}

variable "app_subnet" {
  description = "Subnet for application servers."
  type        = string
}

variable "alb_subnet" {
  description = "Subnet for the Application Load Balancer."
  type        = string
}

# --------------------------
# EC2 Application Configuration
# --------------------------
variable "windows_server_ami_name_pattern" {
  description = "Name pattern to identify the Windows AMI."
  type        = string
}

variable "ami_owner" {
  description = "Owner ID of the AMI"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair for EC2 instances."
  type        = string
}

variable "instance_name_prefix" {
  description = "Prefix for instance names to help with identifying resources."
  type        = string
}

variable "cpu_credits" {
  description = "CPU credit option for burstable performance instances."
  type        = string
}

variable "root_volume_size" {
  description = "Root volume size in GiB."
  type        = number
}

variable "ebs_size" {
  description = "The size of the EBS volume in GiB."
  type        = number
}

variable "ebs_device_name" {
  description = "The device name to attach the EBS volume to."
  type        = string
}

# --------------------------
# Security Group Configuration
# --------------------------

variable "sg_name" {
  description = "The name of the security group."
  type        = string
}

variable "sg_ingress_ports" {
  description = "List of ingress ports and CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_egress_ports" {
  description = "List of egress ports and CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}


# --------------------------
# ALB Configuration
# --------------------------

variable "ssl_policy" {
  description = "The SSL policy to use for HTTPS listeners"
  type        = string
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

}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "The id of Hosted Zone"
  type        = string
}

variable "subdomain_url" {
   description = "The Subdomain url of application redirected to alb"
   type        = string
}
variable "alb_ingress_cidr_blocks" {
  description = "List of ingress ports and CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "alb_egress_cidr_blocks" {
  description = "List of egress ports and CIDR blocks"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}