# Resource Configuration
#
# https://www.terraform.io/docs/configuration/resources.html

# https://www.terraform.io/docs/providers/aws/r/iam_role.html
resource "aws_iam_role" "default" {
  name               = "${var.name}"
  assume_role_policy = "${var.assume_role_policy}"

  path        = "${var.path}"
  description = "${var.description}"

  max_session_duration = "${var.max_session_duration}"
  force_detach_policies = "${var.force_detach_policies}"
}

# https://www.terraform.io/docs/providers/aws/r/iam_policy.html
resource "aws_iam_policy" "default" {
  name   = "${var.name}"
  policy = "${var.policy}"

  path        = "${var.path}"
  description = "${var.description}"
}

# https://www.terraform.io/docs/providers/aws/r/iam_role_policy_attachment.html
resource "aws_iam_role_policy_attachment" "default" {
  role       = "${aws_iam_role.default.name}"
  policy_arn = "${aws_iam_policy.default.arn}"
}
