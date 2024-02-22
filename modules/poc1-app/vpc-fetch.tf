# Fetch details of an existing VPC by its name tag
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${var.selected_vpc_name}"]
  }
}
# Fetch details of the application subnet within the selected VPC
data "aws_subnet" "app_subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.app_subnet}"]
  }
}
# Fetch details of the other subnet within the selected VPC
data "aws_subnet" "alb_subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.alb_subnet}"]
  }
}
