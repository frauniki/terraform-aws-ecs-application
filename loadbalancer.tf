resource "aws_lb_listener_certificate" "this" {
  count = var.load_balancer_certificate_arn != null ? 1 : 0

  listener_arn    = var.load_balancer_listener_arn
  certificate_arn = var.load_balancer_certificate_arn
}

resource "aws_lb_listener_rule" "this" {
  listener_arn = var.load_balancer_listener_arn

  priority = var.load_balancer_listener_rule_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  condition {
    host_header {
      values = [var.domain_name]
    }
  }
}

resource "aws_lb_target_group" "this" {
  name        = "${var.name}-${var.environment}"
  port        = var.listen_port
  target_type = "ip"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = var.health_check_path
    protocol            = "HTTP"
    port                = var.health_check_port
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }
}
