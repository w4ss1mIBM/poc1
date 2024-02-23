
# Terraform AWS Infrastructure Deployment

This project uses Terraform to provision and manage AWS resources for a robust and scalable web application environment. It encompasses configurations for network resources, compute instances, storage, monitoring, and security, ensuring a highly available and secure application deployment.

## Overview

Our Terraform setup orchestrates the creation and management of the following AWS resources:

### Networking

- **VPC Fetching (`vpc-fetch.tf`)**: Retrieves existing VPC and subnet information, ensuring resources are correctly placed within the network.

### Compute Resources

- **EC2 Instances (`ec2.tf`)**: Provisions web servers or applications on EC2 instances, optimized for performance and cost.

- **Application Load Balancers (ALB) (`alb-private.tf`)**: Distributes incoming traffic across EC2 instances to improve availability.

### Storage

- **EBS Volumes (`ebs-volume.tf`)**: Provides additional or specialized storage for EC2 instances.

### Security

- **Security Groups (`security-group.tf`)**: Controls access to EC2 instances and ALBs with firewall rules.

### Monitoring

- **CloudWatch Monitoring (`monitoring.tf`)**: Sets up alarms and notifications for infrastructure monitoring with Amazon CloudWatch.

### Outputs

- **Outputs (`output.tf`)**: Displays important information such as IP addresses and DNS names of the resources.

### Configuration

- **Variables (`variables.tf`)**: Allows customization of the deployment through input variables.

- **Local Values (`locals.tf`)**: Simplifies configuration by defining common constants and calculated values.

## For Non-Technical Stakeholders

This project automates the setup of our web application infrastructure on AWS. It's designed to be secure, scalable, and monitored, ensuring optimal performance and availability. Terraform allows for easy adjustments and consistent environments across development, staging, and production.

### Key Benefits

- **Scalability**: Adjust resources to meet demand.
- **Security**: Ensure application protection through customizable firewall rules.
- **High Availability**: Maintain application performance and availability through load balancing and monitoring.
- **Cost-Effectiveness**: Scale resources according to use, minimizing costs.

## Getting Started

To use this module for deploying your AWS infrastructure, follow these steps:

1. Ensure you have Terraform installed and configured.
2. Clone this repository to your local machine.
3. Navigate to the cloned repository and update the `variables.tf` file with your specific configuration values.
4. Initialize Terraform to download necessary providers and set up the backend:
   ```
   terraform init
   ```
5. Apply the Terraform configuration to create the resources in AWS:
   ```
   terraform apply
   ```
6. Confirm the action by typing `yes` when prompted.

## Contributing

Contributions to this project are welcome! To contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or fix.
3. Commit your changes with clear, descriptive messages.
4. Push your branch and submit a pull request.

Please note that this project adheres to a code of conduct. By participating, you are expected to uphold this code.

### Maintainer

- [@w4ss1m]- For any questions or suggestions.



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_deploy_app_poc1"></a> [deploy\_app\_poc1](#module\_deploy\_app\_poc1) | ./modules/poc1-app/ | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_subnet"></a> [alb\_subnet](#input\_alb\_subnet) | Subnet for the Application Load Balancer. | `string` | `"private-subnet-1"` | no |
| <a name="input_ami_owner"></a> [ami\_owner](#input\_ami\_owner) | Owner ID of the AMI | `string` | `"508072157138"` | no |
| <a name="input_app_subnet"></a> [app\_subnet](#input\_app\_subnet) | Subnet for application servers. | `string` | `"private-subnet-0"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | S3 bucket for storing Terraform state files. | `string` | `"app-administration-playground-terraform-tfstate-stage-v1"` | no |
| <a name="input_cpu_credits"></a> [cpu\_credits](#input\_cpu\_credits) | CPU credit option for burstable performance instances. | `string` | `"unlimited"` | no |
| <a name="input_db_table_name"></a> [db\_table\_name](#input\_db\_table\_name) | DynamoDB table for Terraform state lock. | `string` | `"terraform-state-locking-playground-s3-tfstate-stage"` | no |
| <a name="input_ebs_device_name"></a> [ebs\_device\_name](#input\_ebs\_device\_name) | The device name to attach the EBS volume to. | `string` | `"/dev/sdh"` | no |
| <a name="input_ebs_size"></a> [ebs\_size](#input\_ebs\_size) | The size of the EBS volume in GiB. | `number` | `100` | no |
| <a name="input_emails"></a> [emails](#input\_emails) | List of email addresses to subscribe to the SNS topic. | `list(string)` | <pre>[<br>  "example1@email.com",<br>  "example2@email.com"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment (e.g., prod, dev, staging). | `string` | `"int"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The count of the number of EC2 instances to be deployed. | `number` | `1` | no |
| <a name="input_instance_name_prefix"></a> [instance\_name\_prefix](#input\_instance\_name\_prefix) | Prefix for instance names to help with identifying resources. | `string` | `"poc1"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type. | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the AWS key pair for EC2 instances. | `string` | `"key-playground"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Root volume size in GiB. | `number` | `100` | no |
| <a name="input_selected_vpc_name"></a> [selected\_vpc\_name](#input\_selected\_vpc\_name) | Name of the VPC for deployment. | `string` | `"private-vpc"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | The name of the security group. | `string` | `"web-app-sg"` | no |
| <a name="input_sg_ports_egress"></a> [sg\_ports\_egress](#input\_sg\_ports\_egress) | List of egress ports for the security group. | `list(number)` | <pre>[<br>  443,<br>  3389<br>]</pre> | no |
| <a name="input_sg_ports_ingress"></a> [sg\_ports\_ingress](#input\_sg\_ports\_ingress) | List of ingress ports for the security group. | `list(number)` | <pre>[<br>  443,<br>  3389<br>]</pre> | no |
| <a name="input_sg_protocol"></a> [sg\_protocol](#input\_sg\_protocol) | Protocol for the security group rules. | `string` | `"tcp"` | no |
| <a name="input_windows_server_ami_name_pattern"></a> [windows\_server\_ami\_name\_pattern](#input\_windows\_server\_ami\_name\_pattern) | Name pattern to identify the Windows AMI. | `string` | `"fresh-ec2-without-application-config-ami-Dot-NET-App-Final-*"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.51.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
  	 source  = "<module-path>"
  
	 # Optional variables
  	 alb_subnet  = "private-subnet-1"
  	 ami_owner  = "508072157138"
  	 app_subnet  = "private-subnet-0"
  	 bucket_name  = "app-administration-playground-terraform-tfstate-stage-v1"
  	 cpu_credits  = "unlimited"
  	 db_table_name  = "terraform-state-locking-playground-s3-tfstate-stage"
  	 ebs_device_name  = "/dev/sdh"
  	 ebs_size  = 100
  	 emails  = [
  "example1@email.com",
  "example2@email.com"
]
  	 environment  = "int"
  	 instance_count  = 1
  	 instance_name_prefix  = "poc1"
  	 instance_type  = "t2.micro"
  	 key_name  = "key-playground"
  	 region  = "eu-west-1"
  	 root_volume_size  = 100
  	 selected_vpc_name  = "private-vpc"
  	 sg_name  = "web-app-sg"
  	 sg_ports_egress  = [
  443,
  3389
]
  	 sg_ports_ingress  = [
  443,
  3389
]
  	 sg_protocol  = "tcp"
  	 windows_server_ami_name_pattern  = "fresh-ec2-without-application-config-ami-Dot-NET-App-Final-*"
}
```
  ## Resources

No resources.
  ## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_subnet"></a> [alb\_subnet](#input\_alb\_subnet) | Subnet for the Application Load Balancer. | `string` | `"private-subnet-1"` | no |
| <a name="input_ami_owner"></a> [ami\_owner](#input\_ami\_owner) | Owner ID of the AMI | `string` | `"508072157138"` | no |
| <a name="input_app_subnet"></a> [app\_subnet](#input\_app\_subnet) | Subnet for application servers. | `string` | `"private-subnet-0"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | S3 bucket for storing Terraform state files. | `string` | `"app-administration-playground-terraform-tfstate-stage-v1"` | no |
| <a name="input_cpu_credits"></a> [cpu\_credits](#input\_cpu\_credits) | CPU credit option for burstable performance instances. | `string` | `"unlimited"` | no |
| <a name="input_db_table_name"></a> [db\_table\_name](#input\_db\_table\_name) | DynamoDB table for Terraform state lock. | `string` | `"terraform-state-locking-playground-s3-tfstate-stage"` | no |
| <a name="input_ebs_device_name"></a> [ebs\_device\_name](#input\_ebs\_device\_name) | The device name to attach the EBS volume to. | `string` | `"/dev/sdh"` | no |
| <a name="input_ebs_size"></a> [ebs\_size](#input\_ebs\_size) | The size of the EBS volume in GiB. | `number` | `100` | no |
| <a name="input_emails"></a> [emails](#input\_emails) | List of email addresses to subscribe to the SNS topic. | `list(string)` | <pre>[<br>  "example1@email.com",<br>  "example2@email.com"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment (e.g., prod, dev, staging). | `string` | `"int"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The count of the number of EC2 instances to be deployed. | `number` | `1` | no |
| <a name="input_instance_name_prefix"></a> [instance\_name\_prefix](#input\_instance\_name\_prefix) | Prefix for instance names to help with identifying resources. | `string` | `"poc1"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type. | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the AWS key pair for EC2 instances. | `string` | `"key-playground"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Root volume size in GiB. | `number` | `100` | no |
| <a name="input_selected_vpc_name"></a> [selected\_vpc\_name](#input\_selected\_vpc\_name) | Name of the VPC for deployment. | `string` | `"private-vpc"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | The name of the security group. | `string` | `"web-app-sg"` | no |
| <a name="input_sg_ports_egress"></a> [sg\_ports\_egress](#input\_sg\_ports\_egress) | List of egress ports for the security group. | `list(number)` | <pre>[<br>  443,<br>  3389<br>]</pre> | no |
| <a name="input_sg_ports_ingress"></a> [sg\_ports\_ingress](#input\_sg\_ports\_ingress) | List of ingress ports for the security group. | `list(number)` | <pre>[<br>  443,<br>  3389<br>]</pre> | no |
| <a name="input_sg_protocol"></a> [sg\_protocol](#input\_sg\_protocol) | Protocol for the security group rules. | `string` | `"tcp"` | no |
| <a name="input_windows_server_ami_name_pattern"></a> [windows\_server\_ami\_name\_pattern](#input\_windows\_server\_ami\_name\_pattern) | Name pattern to identify the Windows AMI. | `string` | `"fresh-ec2-without-application-config-ami-Dot-NET-App-Final-*"` | no |
  ## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->