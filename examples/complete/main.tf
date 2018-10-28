module "iam_role" {
  source             = "../../"
  name               = "complete"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
  policy             = "${data.aws_iam_policy_document.policy.json}"

  path        = "/ec2/"
  description = "Describe EC2"

  max_session_duration  = 7200
  force_detach_policies = true
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
