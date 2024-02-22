terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "app-administration-playground-terraform-tfstate-stage-v1"
    key            = "state/int/ec2-tfstate/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locking-playground-s3-tfstate-stage"
    encrypt        = true
  }
}

module "deploy_app_poc1" {
  source = "./modules/poc1-app/"

  region                          = var.region
  windows_server_ami_name_pattern = var.windows_server_ami_name_pattern
  ami_owner                       = var.ami_owner
  instance_type                   = var.instance_type
  key_name                        = var.key_name
  instance_count                  = var.instance_count
  instance_name_prefix            = var.instance_name_prefix
  cpu_credits                     = var.cpu_credits
  root_volume_size                = var.root_volume_size
  ebs_size                        = var.ebs_size
  ebs_device_name                 = var.ebs_device_name
  sg_name                         = var.sg_name
  sg_ports_ingress                = var.sg_ports_ingress
  sg_ports_egress                 = var.sg_ports_egress
  sg_protocol                     = var.sg_protocol
  selected_vpc_name               = var.selected_vpc_name
  app_subnet                      = var.app_subnet
  alb_subnet                      = var.alb_subnet
  emails                          = var.emails
  // Ensure to pass any other required variables

}
