output "iam_role_arn" {
  value       = aws_iam_role.default.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "iam_role_create_date" {
  value       = aws_iam_role.default.create_date
  description = "The creation date of the IAM role."
}

output "iam_role_unique_id" {
  value       = aws_iam_role.default.unique_id
  description = "The stable and unique string identifying the role."
}

output "iam_role_name" {
  value       = aws_iam_role.default.name
  description = "The name of the role."
}

output "iam_role_description" {
  value       = aws_iam_role.default.description
  description = "The description of the role."
}

output "iam_policy_id" {
  value       = aws_iam_policy.default.id
  description = "The policy's ID."
}

output "iam_policy_arn" {
  value       = aws_iam_policy.default.arn
  description = "The ARN assigned by AWS to this policy."
}

output "iam_policy_description" {
  value       = aws_iam_policy.default.description
  description = "The description of the policy."
}

output "iam_policy_name" {
  value       = aws_iam_policy.default.name
  description = "The name of the policy."
}

output "iam_policy_path" {
  value       = aws_iam_policy.default.path
  description = "The path of the policy in IAM."
}

output "iam_policy_document" {
  value       = aws_iam_policy.default.policy
  description = "The policy document."
}
