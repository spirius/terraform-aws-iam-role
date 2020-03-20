data "aws_iam_policy_document" "assume_role" {
  source_json = var.assume_role_policy

  statement {
    sid = "Module"

    actions = ["sts:AssumeRole"]

    dynamic "principals" {
      for_each = var.assume_role_services == null ? [] : [var.assume_role_services]

      content {
        type        = "Service"
        identifiers = principals.value
      }
    }

    dynamic "principals" {
      for_each = var.assume_role_arns == null ? [] : [var.assume_role_arns]

      content {
        type        = "AWS"
        identifiers = principals.value
      }
    }
  }
}

resource "aws_iam_role" "role" {
  path = var.path
  name = var.name

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "access_policy" {
  count = var.access_policy == null ? 0 : 1

  name   = "AccessPolicy"
  role   = aws_iam_role.role.name
  policy = var.access_policy
}

resource "aws_iam_role_policy_attachment" "managed_policies" {
  for_each = toset(var.managed_policies)

  role       = aws_iam_role.role.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "profile" {
  count = var.instance_profile ? 1 : 0

  name = aws_iam_role.role.name
  role = aws_iam_role.role.name
}
