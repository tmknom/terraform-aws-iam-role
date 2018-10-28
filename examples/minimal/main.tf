module "iam_role" {
  source             = "../../"
  name               = "minimal"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
  policy             = "${data.aws_iam_policy_document.policy.json}"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:Describe*",
    ]

    resources = ["*"]
  }
}
