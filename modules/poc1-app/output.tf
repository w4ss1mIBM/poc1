

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = aws_lb.alb_private.dns_name
}
# Output the IDs of the fetched subnets for use in other configurations
output "subdomain_url" {
  value = aws_route53_record.app_record.fqdn
}

# Output the private IP addresses of the EC2 instances
output "windows_ec2_instance_private_ip" {
  description = "The private IP addresses of the Windows EC2 instances."
  value       = aws_instance.windows_ec2.private_ip
}
