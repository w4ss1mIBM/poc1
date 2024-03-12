

# If your instances are expected to have public IP addresses, output those as well
output "windows_ec2_instance_public_ips" {
  description = "The public IP addresses of the Windows EC2 instances."
  value       = module.deploy_app_poc1.windows_ec2_instance_public_ips
}

# Output the private IP addresses of the EC2 instances
output "windows_ec2_instance_private_ips" {
  description = "The private IP addresses of the Windows EC2 instances."
  value       = module.deploy_app_poc1.windows_ec2_instance_private_ips
}
output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = module.deploy_app_poc1.alb_dns_name
}
