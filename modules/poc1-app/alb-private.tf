resource "aws_lb" "alb_private" {
  # Simplifying the name for readability and to avoid redundancy.
  name               = "alb-private-${var.environment}"
  internal           = true
  load_balancer_type = "application"
  subnets = [
    data.aws_subnet.app_subnet.id,
    data.aws_subnet.alb_subnet.id,
  ]
  security_groups = [
    aws_security_group.alb_security_group.id,
  ]
}

resource "aws_lb_target_group" "alb_ec2_instance_tg" {
  # Name now includes environment for clarity and avoids typos.
  name     = "alb-tg-ec2-${var.environment}"
  vpc_id   = data.aws_vpc.selected.id
  port     = 80
  protocol = "HTTP"

  health_check {
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }
}

resource "aws_lb_target_group_attachment" "ec2_tg_attachment" {
  # Improved readability by using descriptive resource and variable names.
  target_group_arn = aws_lb_target_group.alb_ec2_instance_tg.arn
  target_id        = aws_instance.windows_ec2.id
  port             = 80
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb_private.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type = "authenticate-oidc"

    authenticate_oidc {
      authorization_endpoint      = var.oidc_settings.authorization_endpoint
      client_id                   = var.client_id
      client_secret               = var.client_secret
      issuer                      = var.oidc_settings.issuer
      token_endpoint              = var.oidc_settings.token_endpoint
      user_info_endpoint          = var.oidc_settings.user_info_endpoint
      scope                       = var.oidc_settings.scope
      on_unauthenticated_request = var.oidc_settings.on_unauthenticated_request
    }
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_ec2_instance_tg.arn
  }
}
