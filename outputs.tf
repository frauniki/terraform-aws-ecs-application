locals {
  output_data = {
    iam_role_arn      = aws_iam_role.this.arn
    security_group_id = module.security_group.security_group_id
    target_group_arn  = aws_lb_target_group.this.arn
    ecs_environments_data = jsonencode(var.env_vars != null ? [for key in keys(var.env_vars) : {
      name  = key
      value = var.env_vars[key]
    }] : [])
    ecs_secrets_data = jsonencode(var.secret_env_vars != null ? [for key in keys(var.secret_env_vars) : {
      name      = key
      valueFrom = "${module.secrets_manager[0].secret_arn}:${key}::"
    }] : [])
    cloudwatch_log_group_name = aws_cloudwatch_log_group.this.name
    s3_log_prefix             = "ecs/${var.name}/${var.environment}/"
  }
}

output "iam_role_arn" {
  value = local.output_data.iam_role_arn
}

output "security_group_id" {
  value = local.output_data.security_group_id
}

output "target_group_arn" {
  value = local.output_data.target_group_arn
}

output "ecs_environments_data" {
  value = local.output_data.ecs_environments_data
}

output "ecs_secrets_data" {
  value = local.output_data.ecs_secrets_data
}

output "cloudwatch_log_group_name" {
  value = local.output_data.cloudwatch_log_group_name
}

output "s3_log_prefix" {
  value = local.output_data.s3_log_prefix
}

output "_" {
  value = local.output_data
}
