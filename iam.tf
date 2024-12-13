resource "aws_iam_role" "this" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ecs-tasks.amazonaws.com"
          }
          Condition = {
            StringEquals = {
              "aws:SourceAccount" = "${data.aws_caller_identity.current.account_id}"
            }
            ArnLike = {
              "aws:SourceArn" = "arn:aws:ecs:ap-northeast-1:${data.aws_caller_identity.current.account_id}:*"
            }
          }
          Sid = "ECSTaskExecutionAssumeRole"
        },
      ]
      Version = "2012-10-17"
    }
  )

  name = "${var.name}-${var.environment}"
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.iam_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}
