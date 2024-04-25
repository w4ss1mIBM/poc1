# Terraform Module POC1 Prerequisites

Before using this Terraform module, ensure you have completed the following prerequisites:

## 1. Create User For Terraform


### 1.1. User for Terraform

- Create an IAM user with programmatic access.
- Attach policies to the user for managing AWS resources through Terraform:
- `AmazonDynamoDBFullAccess`: Grants full access to DynamoDB.
- `AmazonEC2FullAccess`: Grants full access to EC2.
- `AmazonEventBridgeFullAccess`: Grants full access to EventBridge.
- `AmazonS3FullAccess`: Grants full access to S3.
- `AmazonSNSFullAccess`: Grants full access to SNS.
- `AmazonVPCFullAccess`: Grants full access to VPC.
- `CloudWatchAgentServerPolicy`: Allows EC2 instances to interact with CloudWatch for monitoring and management.
- `IAMFullAccess`: Grants full access to IAM.
- `KmsPolicyForAMI`: Specifically tailored for managing keys used in AMI encryption/decryption.
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
```

## 2. Create VPC with Two Subnets

### 2.1. VPC

- Define the VPC configuration including CIDR block, route table, and internet gateway.

### 2.2. Subnets

- Create two subnets within the VPC in different availability zones.

## 3. Create Hosted Zone And Import Certificate

### 3.1. Create Hosted Zone And Import Certificate

- Create Hosted Zone And Import Certificate To provide HostedZone ID & Certificate ARN 

## 4. Store Secrets in GitHub Secrets

### 4.1. GitHub Secrets

Store the following secrets in GitHub Secrets for secure access:
- `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `AWS_REGION`: The AWS region where resources will be deployed.
- `TF_BACKEND_BUCKET`: Name of the S3 bucket for storing Terraform state.
- `TF_BACKEND_KEY`: Key name for the Terraform state file in the S3 bucket.
- `TF_BACKEND_DYNAMODB_TABLE`: Name of the DynamoDB table for Terraform state locking.
- `OIDC_CLIENT_ID`: Your OIDC client ID for accessing AWS services.
- `OIDC_CLIENT_SECRET`: Your OIDC client secret for accessing AWS services.

## 5. Modify Terraform Variables

### 5.1. VPC Variables

- Update VPC-related variables such as CIDR block, subnet configurations, etc., as per your requirements.

### 5.2. Security Group and ALB Variables

- Adjust security group and Application Load Balancer (ALB) configurations based on your needs.

## 6. Check All Variables

### 6.1. Variable Validation

- Verify all variables in the Terraform configuration to ensure they match your environment and requirements.

## 7. Execute Terraform Workflows

### 7.1. (One Time Provision) Terraform State

- This workflow provisions the S3 bucket and DynamoDB table for Terraform state management.
- Ensure all configurations are defined in your Terraform files before execution.
- Execute the Terraform plan to review changes, then apply with the Terraform apply command.
- Verify the creation of resources through the AWS Management Console or Terraform apply logs.

### 7.2. Provision P/D Destroy AWS Resources

- This workflow provisions Production (P) and Development (D) AWS resources as defined in your Terraform files.
- Includes creation of EC2 instances, VPC configurations, subnets, and other required AWS resources.
- Start with the Terraform plan command to review planned resources creation, then apply with the Terraform apply command.
- Monitor the logs for any errors or warnings and verify all resources are provisioned as expected.

**Important:** Always review Terraform plans before applying to avoid unintended changes to your infrastructure. Enable logging for both workflows to capture execution process details, crucial for troubleshooting any provisioning issues.

# Terraform AWS Infrastructure Deployment POC1 Module

This project uses Terraform to provision and manage AWS resources for POC1 applications Type. It encompasses configurations for network resources, compute instances, storage, monitoring, and security, ensuring a highly available and secure application deployment.

# Terraform Module Prerequisites

Before using this Terraform module, ensure you have completed the following prerequisites:

## 1. Create User For Terraform


### 1.1. User for Terraform

- Create an IAM user with programmatic access.
- Attach policies to the user for managing AWS resources through Terraform.

## 2. Create VPC with Two Subnets

### 2.1. VPC

- Define the VPC configuration including CIDR block, route table, and internet gateway.

### 2.2. Subnets

- Create two subnets within the VPC in different availability zones.

## 3. Create Hosted Zone And Import Certificate

### 3.1. Create Hosted Zone And Import Certificate

- Create Hosted Zone And Import Certificate

## 4. Store Secrets in GitHub Secrets

### 4.1. GitHub Secrets

Store the following secrets in GitHub Secrets for secure access:
- `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `AWS_REGION`: The AWS region where resources will be deployed.
- `TF_BACKEND_BUCKET`: Name of the S3 bucket for storing Terraform state.
- `TF_BACKEND_KEY`: Key name for the Terraform state file in the S3 bucket.
- `TF_BACKEND_DYNAMODB_TABLE`: Name of the DynamoDB table for Terraform state locking.
- `OIDC_CLIENT_ID`: Your OIDC client ID for accessing AWS services.
- `OIDC_CLIENT_SECRET`: Your OIDC client secret for accessing AWS services.

## 5. Modify Terraform Variables

### 5.1. VPC Variables

- Update VPC-related variables such as CIDR block, subnet configurations, etc., as per your requirements.

### 5.2. Security Group and ALB Variables

- Adjust security group and Application Load Balancer (ALB) configurations based on your needs.

## 6. Check All Variables

### 6.1. Variable Validation

- Verify all variables in the Terraform configuration to ensure they match your environment and requirements.

## 7. Execute Terraform Workflows

### 7.1. (One Time Provision) Terraform State

- This workflow provisions the S3 bucket and DynamoDB table for Terraform state management.
- Ensure all configurations are defined in your Terraform files before execution.
- Execute the Terraform plan to review changes, then apply with the Terraform apply command.
- Verify the creation of resources through the AWS Management Console or Terraform apply logs.

### 7.2. Provision P/D AWS Resources

- This workflow provisions Production (P) and Development (D) AWS resources as defined in your Terraform files.
- Includes creation of EC2 instances, VPC configurations, subnets, and other required AWS resources.
- Start with the Terraform plan command to review planned resources creation, then apply with the Terraform apply command.
- Monitor the logs for any errors or warnings and verify all resources are provisioned as expected.

**Important:** Always review Terraform plans before applying to avoid unintended changes to your infrastructure. Enable logging for both workflows to capture execution process details, crucial for troubleshooting any provisioning issues.

# Terraform AWS Infrastructure Deployment POC1 Module

This project uses Terraform to provision and manage AWS resources for POC1 applications Type. It encompasses configurations for network resources, compute instances, storage, monitoring, and security, ensuring a highly available and secure application deployment.

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

- **CloudWatch Monitoring (`monitoring.tf`)**: Configure Roles And Sets up alarms and notifications for infrastructure monitoring with Amazon CloudWatch.

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
  
	 # Required variables
  	 client_id  = 
  	 client_secret  = 
  
	 # Optional variables
  	 alb_ingress_cidr_blocks  = [
  {
    "cidr_blocks": [
      "0.0.0.0/0"
    ],
    "from_port": 80,
    "protocol": "tcp",
    "to_port": 80
  },
  {
    "cidr_blocks": [
      "0.0.0.0/0"
    ],
    "from_port": 443,
    "protocol": "tcp",
    "to_port": 443
  }
]
  	 alb_subnet  = "private-subnet-1"
  	 ami_owner  = "694493444487"
  	 app_subnet  = "private-subnet-0"
  	 certificate_arn  = "arn:aws:acm:eu-west-1:508072157138:certificate/b5ed352a-865f-49cd-bdf4-ed5abccc1b48"
  	 cpu_credits  = "unlimited"
  	 ebs_device_name  = "/dev/sdh"
  	 ebs_size  = 40
  	 environment  = "int"
  	 hosted_zone_id  = "Z05358721UPIUVROSJBSM"
  	 instance_name_prefix  = "EC2-WEBAPP"
  	 instance_type  = "t2.micro"
  	 key_name  = "key-pair"
  	 oidc_settings  = {
  "authorization_endpoint": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/authorize",
  "issuer": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x",
  "on_unauthenticated_request": "authenticate",
  "scope": "openid profile bmwids b2xroles",
  "token_endpoint": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/access_token",
  "user_info_endpoint": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/userinfo"
}
  	 region  = "eu-west-1"
  	 selected_vpc_name  = "private-vpc"
  	 sg_egress_ports  = [
  {
    "cidr_blocks": [
      "0.0.0.0/0"
    ],
    "from_port": 0,
    "protocol": "-1",
    "to_port": 0
  }
]
  	 sg_ingress_ports  = [
  {
    "cidr_blocks": [
      "10.0.0.0/16"
    ],
    "from_port": 80,
    "protocol": "tcp",
    "to_port": 80
  },
  {
    "cidr_blocks": [
      "192.168.1.0/24"
    ],
    "from_port": 443,
    "protocol": "tcp",
    "to_port": 443
  }
]
  	 sg_name  = "app-sg"
  	 sg_ports_egress  = [
  80,
  443
]
  	 sg_protocol  = "tcp"
  	 ssl_policy  = "ELBSecurityPolicy-2016-08"
  	 subdomain_url  = "app.meetingroom-int.eu-west-1.aws.cloud.bmw"
  	 windows_server_ami_name_pattern  = "FRESH-AMI-*"
}
```
  ## Resources

No resources.
  ## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_ingress_cidr_blocks"></a> [alb\_ingress\_cidr\_blocks](#input\_alb\_ingress\_cidr\_blocks) | List of ingress ports and CIDR blocks | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 80,<br>    "protocol": "tcp",<br>    "to_port": 80<br>  },<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 443,<br>    "protocol": "tcp",<br>    "to_port": 443<br>  }<br>]</pre> | no |
| <a name="input_alb_subnet"></a> [alb\_subnet](#input\_alb\_subnet) | Subnet for the Application Load Balancer. | `string` | `"private-subnet-1"` | no |
| <a name="input_ami_owner"></a> [ami\_owner](#input\_ami\_owner) | Owner ID of the AMI | `string` | `"694493444487"` | no |
| <a name="input_app_subnet"></a> [app\_subnet](#input\_app\_subnet) | Subnet for application servers. | `string` | `"private-subnet-0"` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The ARN of the ACM certificate | `string` | `"arn:aws:acm:eu-west-1:508072157138:certificate/b5ed352a-865f-49cd-bdf4-ed5abccc1b48"` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | OIDC client ID | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | OIDC client secret | `string` | n/a | yes |
| <a name="input_cpu_credits"></a> [cpu\_credits](#input\_cpu\_credits) | CPU credit option for burstable performance instances. | `string` | `"unlimited"` | no |
| <a name="input_ebs_device_name"></a> [ebs\_device\_name](#input\_ebs\_device\_name) | The device name to attach the EBS volume to. | `string` | `"/dev/sdh"` | no |
| <a name="input_ebs_size"></a> [ebs\_size](#input\_ebs\_size) | The size of the EBS volume in GiB. | `number` | `40` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment (e.g., prod, dev, staging). | `string` | `"int"` | no |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | The id of Hosted Zone | `string` | `"Z05358721UPIUVROSJBSM"` | no |
| <a name="input_instance_name_prefix"></a> [instance\_name\_prefix](#input\_instance\_name\_prefix) | Prefix for instance names to help with identifying resources. | `string` | `"EC2-WEBAPP"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type. | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the AWS key pair for EC2 instances. | `string` | `"key-pair"` | no |
| <a name="input_oidc_settings"></a> [oidc\_settings](#input\_oidc\_settings) | OIDC authentication settings | <pre>object({<br>    authorization_endpoint     = string<br>    issuer                     = string<br>    token_endpoint             = string<br>    user_info_endpoint         = string<br>    scope                      = string<br>    on_unauthenticated_request = string<br>  })</pre> | <pre>{<br>  "authorization_endpoint": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/authorize",<br>  "issuer": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x",<br>  "on_unauthenticated_request": "authenticate",<br>  "scope": "openid profile bmwids b2xroles",<br>  "token_endpoint": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/access_token",<br>  "user_info_endpoint": "https://auth-i.bmwgroup.net:443/auth/oauth2/realms/root/realms/intranetb2x/userinfo"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_selected_vpc_name"></a> [selected\_vpc\_name](#input\_selected\_vpc\_name) | Name of the VPC for deployment. | `string` | `"private-vpc"` | no |
| <a name="input_sg_egress_ports"></a> [sg\_egress\_ports](#input\_sg\_egress\_ports) | List of egress ports and CIDR blocks | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_sg_ingress_ports"></a> [sg\_ingress\_ports](#input\_sg\_ingress\_ports) | List of ingress ports and CIDR blocks | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "10.0.0.0/16"<br>    ],<br>    "from_port": 80,<br>    "protocol": "tcp",<br>    "to_port": 80<br>  },<br>  {<br>    "cidr_blocks": [<br>      "192.168.1.0/24"<br>    ],<br>    "from_port": 443,<br>    "protocol": "tcp",<br>    "to_port": 443<br>  }<br>]</pre> | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | The name of the security group. | `string` | `"app-sg"` | no |
| <a name="input_sg_ports_egress"></a> [sg\_ports\_egress](#input\_sg\_ports\_egress) | List of egress ports for the security group. | `list(number)` | <pre>[<br>  80,<br>  443<br>]</pre> | no |
| <a name="input_sg_protocol"></a> [sg\_protocol](#input\_sg\_protocol) | Protocol for the security group rules. | `string` | `"tcp"` | no |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | The SSL policy to use for HTTPS listeners | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| <a name="input_subdomain_url"></a> [subdomain\_url](#input\_subdomain\_url) | The Subdomain url of application redirected to alb | `string` | `"app.meetingroom-int.eu-west-1.aws.cloud.bmw"` | no |
| <a name="input_windows_server_ami_name_pattern"></a> [windows\_server\_ami\_name\_pattern](#input\_windows\_server\_ami\_name\_pattern) | Name pattern to identify the Windows AMI. | `string` | `"FRESH-AMI-*"` | no |
  ## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | The DNS name of the Application Load Balancer. |
| <a name="output_subdomain_url"></a> [subdomain\_url](#output\_subdomain\_url) | n/a |
| <a name="output_windows_ec2_instance_private_ip"></a> [windows\_ec2\_instance\_private\_ip](#output\_windows\_ec2\_instance\_private\_ip) | The private IP addresses of the Windows EC2 instances. |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
## Footer
Contributor Names
