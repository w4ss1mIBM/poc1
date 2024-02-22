# --------------------------
# AWS Backend Configuration
# --------------------------
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "S3 bucket for storing Terraform state files."
  type        = string
  default     = "app-administration-playground-terraform-tfstate-stage-v1"
}

variable "db_table_name" {
  description = "DynamoDB table for Terraform state lock."
  type        = string
  default     = "terraform-state-locking-playground-s3-tfstate-stage"
}

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
  default     = "fresh-ec2-without-application-config-ami-Dot-NET-App-Final-*"
}

variable "ami_owner" {
  description = "Owner ID of the AMI"
  type        = string
  default     = "508072157138"
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

variable "instance_count" {
  description = "The count of the number of EC2 instances to be deployed."
  type        = number
  default     = 1
}

variable "instance_name_prefix" {
  description = "Prefix for instance names to help with identifying resources."
  type        = string
  default     = "poc1"
}

variable "cpu_credits" {
  description = "CPU credit option for burstable performance instances."
  type        = string
  default     = "unlimited"
}

variable "root_volume_size" {
  description = "Root volume size in GiB."
  type        = number
  default     = 100
}

variable "ebs_size" {
  description = "The size of the EBS volume in GiB."
  type        = number
  default     = 100
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
  default     = "web-app-sg"
}

variable "sg_ports_ingress" {
  description = "List of ingress ports for the security group."
  type        = list(number)
  default     = [443, 3389]
}

variable "sg_ports_egress" {
  description = "List of egress ports for the security group."
  type        = list(number)
  default     = [443, 3389]
}

variable "sg_protocol" {
  description = "Protocol for the security group rules."
  type        = string
  default     = "tcp"
}

# --------------------------
# Monitoring Configuration
# --------------------------
variable "emails" {
  description = "List of email addresses to subscribe to the SNS topic."
  type        = list(string)
  default     = ["example1@email.com", "example2@email.com"]
}
