resource "aws_cloudwatch_log_group" "this" {
  name              = "/ecs/${var.name}/${var.environment}"
  retention_in_days = var.cloudwatch_logs_retention_in_days
}

resource "aws_cloudwatch_log_subscription_filter" "this" {
  name            = "${var.name}-${var.environment}-filter"
  role_arn        = var.cloudwatch_log_subscription_filter_role_arn
  log_group_name  = aws_cloudwatch_log_group.this.name
  filter_pattern  = ""
  destination_arn = var.cloudwatch_log_subscription_filter_destination_arn
}
