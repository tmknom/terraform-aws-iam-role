# Output Configuration
#
# https://www.terraform.io/docs/configuration/outputs.html

output "iam_role_arn" {
  value       = "${aws_iam_role.default.arn}"
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "iam_role_create_date" {
  value       = "${aws_iam_role.default.create_date}"
  description = "The creation date of the IAM role."
}

output "iam_role_unique_id" {
  value       = "${aws_iam_role.default.unique_id}"
  description = "The stable and unique string identifying the role."
}

output "iam_role_name" {
  value       = "${aws_iam_role.default.name}"
  description = "The name of the role."
}

output "iam_role_description" {
  value       = "${aws_iam_role.default.description}"
  description = "The description of the role."
}
