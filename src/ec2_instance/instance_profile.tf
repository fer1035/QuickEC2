data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions   = var.inline_actions
    resources = var.inline_resources
  }
}

resource "aws_iam_role" "role" {
  managed_policy_arns = var.managed_policy_arns

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name   = "InstanceProfileInlinePolicy"
    policy = data.aws_iam_policy_document.inline_policy.json
  }
}

resource "aws_iam_instance_profile" "profile" {
  name = aws_iam_role.role.name
  role = aws_iam_role.role.name
}
