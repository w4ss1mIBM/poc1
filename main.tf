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
    bucket         = "meetingroom-int-backend-terraform-tfstate-poc3"
    key            = "state/int/ec2-tfstate/terraformv2.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "meetingroom-int-terraform-state-locking-poc3"
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
  instance_name_prefix            = var.instance_name_prefix
  cpu_credits                     = var.cpu_credits
  ebs_size                        = var.ebs_size
  ebs_device_name                 = var.ebs_device_name
  sg_name                         = var.sg_name
  selected_vpc_name               = var.selected_vpc_name
  app_subnet                      = var.app_subnet
  alb_subnet                      = var.alb_subnet
  alb_ingress_cidr_blocks         = var.alb_ingress_cidr_blocks
  alb_egress_cidr_blocks          = var.alb_egress_cidr_blocks
  client_id                       = var.client_id
  client_secret                   = var.client_secret
  sg_egress_ports                 = var.sg_egress_ports
  sg_ingress_ports                = var.sg_ingress_ports
  certificate_arn                 = var.certificate_arn
  hosted_zone_id                  = var.hosted_zone_id
  subdomain_url                   = var.subdomain_url
  oidc_settings                   = var.oidc_settings
  ssl_policy                      = var.ssl_policy
  environment                     = var.environment
  root_volume_size                = var.root_volume_size

}
