

# Output the private IP addresses of the EC2 instances
output "windows_ec2_instance_private_ip" {
  description = "The private IP addresses of the Windows EC2 instances."
  value       = module.deploy_app_poc1.windows_ec2_instance_private_ip
}
output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = module.deploy_app_poc1.alb_dns_name
}
output "subdomain_url" {
  value = module.deploy_app_poc1.subdomain_url
}
