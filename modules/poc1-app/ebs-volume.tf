# Create EBS Volumes and attach them to Windows EC2 instances
resource "aws_ebs_volume" "ebs_volume_for_windows_ec2" {
  count             = length(aws_instance.windows_ec2)
  availability_zone = data.aws_subnet.app_subnet.availability_zone
  size              = var.ebs_size

  tags = {
    Name = "ebs-${var.instance_name_prefix}-${count.index}"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  count       = length(aws_instance.windows_ec2)
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.ebs_volume_for_windows_ec2[count.index].id
  instance_id = element(aws_instance.windows_ec2.*.id, count.index)
}
