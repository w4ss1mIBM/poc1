# Output the IDs of the fetched subnets for use in other configurations
output "selected_vpc_id" {
  value       = data.aws_vpc.selected.id
  description = "The ID of the selected VPC."
}

output "app_subnet_id" {
  value       = data.aws_subnet.app_subnet.id
  description = "The ID of the application subnet."
}

output "db_subnet_id" {
  value       = data.aws_subnet.alb_subnet.id
  description = "The ID of the alb subnet."
}
##################################################################################################################################
# Output the IDs of the created security groups
output "tls_sg_id" {
  value       = aws_security_group.allow_tls.id
  description = "The ID of the security group allowing TLS traffic."
}

output "alb_sg_id" {
  value       = aws_security_group.alb_security_group.id
  description = "The ID of the ALB security group in the private subnet."
}
##################################################################################################################################
# Output for the Application Load Balancer (ALB)
output "alb_arn" {
  description = "The ARN of the Application Load Balancer."
  value       = aws_lb.alb_private.arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = aws_lb.alb_private.dns_name
}

# Output for the Target Group
output "tg_arn" {
  description = "The ARN of the Target Group associated with the ALB."
  value       = aws_lb_target_group.alb_ec2_instance_tg.arn
}

##################################################################################################################################
# Output the IDs of the created EBS Volumes
# output "ebs_volume_ids" {
#   description = "The IDs of the EBS volumes created for Windows EC2 instances."
#   value       = aws_ebs_volume.ebs_volume_for_windows_ec2[*].id
# }

# # Output the attachment details of the EBS Volumes
# output "ebs_volume_attachment_details" {
#   description = "Details of the EBS volume attachments."
#   value = [
#     for attachment in aws_volume_attachment.ebs_att : {
#       instance_id = attachment.instance_id
#       volume_id   = attachment.volume_id
#       device_name = attachment.device_name
#     }
#   ]
# }
##################################################################################################################################

# Output the IDs of the created EC2 instances
output "windows_ec2_instance_ids" {
  description = "The IDs of the Windows EC2 instances."
  value       = aws_instance.windows_ec2[*].id
}

# If your instances are expected to have public IP addresses, output those as well
output "windows_ec2_instance_public_ips" {
  description = "The public IP addresses of the Windows EC2 instances."
  value       = aws_instance.windows_ec2[*].public_ip
}

# Output the private IP addresses of the EC2 instances
output "windows_ec2_instance_private_ips" {
  description = "The private IP addresses of the Windows EC2 instances."
  value       = aws_instance.windows_ec2[*].private_ip
}
