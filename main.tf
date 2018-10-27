# Resource Configuration
#
# https://www.terraform.io/docs/configuration/resources.html

# https://www.terraform.io/docs/providers/aws/r/iam_role.html
resource "aws_iam_role" "default" {
  name               = "${var.name}"
  assume_role_policy = "${var.assume_role_policy}"
}
