module "secrets_manager" {
  count = var.secret_env_vars != null ? 1 : 0

  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "1.3.1"

  name                    = "${var.name}-${var.environment}"
  recovery_window_in_days = 30

  create_policy       = true
  block_public_policy = true
  policy_statements = {
    ecs = {
      sid = "ECSReadPolicy"
      principals = [{
        type        = "AWS"
        identifiers = [aws_iam_role.this.arn]
      }]
      actions = [
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
      ]
      resources = ["*"]
    }
  }

  secret_string = jsonencode(var.secret_env_vars)
}
