output "role" {
  description = "aws_iam_role resource."
  value       = aws_iam_role.role
}

output "profile" {
  description = "aws_iam_instance_profile resource."
  value       = var.instance_profile ? aws_iam_instance_profile.profile[0] : null
}
