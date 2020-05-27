output "role" {
  description = "aws_iam_role resource."
  value       = aws_iam_role.role

  depends_on = [
    aws_iam_role_policy.access_policy,
    aws_iam_role_policy_attachment.managed_policies,
  ]
}

output "profile" {
  description = "aws_iam_instance_profile resource."
  value       = var.instance_profile ? aws_iam_instance_profile.profile[0] : null

  depends_on = [
    aws_iam_role_policy.access_policy,
    aws_iam_role_policy_attachment.managed_policies,
  ]
}
