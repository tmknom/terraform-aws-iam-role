# terraform-aws-iam-role

[![CircleCI](https://circleci.com/gh/tmknom/terraform-aws-iam-role.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-aws-iam-role)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-iam-role.svg)](https://registry.terraform.io/modules/tmknom/iam-role/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-iam-role.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates IAM Role and IAM Policy resources on AWS.

## Description

Provision [IAM Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
and its own [Customer Managed Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html#customer-managed-policies).
This module provides recommended settings.

- Use managed policies instead of inline policies

## Usage

### Minimal

```hcl
module "iam_role" {
  source             = "git::https://github.com/tmknom/terraform-aws-iam-role.git?ref=tags/1.2.0"
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
```

### Complete

```hcl
module "iam_role" {
  source             = "git::https://github.com/tmknom/terraform-aws-iam-role.git?ref=tags/1.2.0"
  name               = "complete"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
  policy             = "${data.aws_iam_policy_document.policy.json}"

  path        = "/ec2/"
  description = "Describe EC2"

  max_session_duration  = 7200
  force_detach_policies = true
}

data "aws_iam_policy_document" "assume_role_policy" {
  # Omitted below.
}

data "aws_iam_policy_document" "policy" {
  # Omitted below.
}
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-iam-role/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-iam-role/tree/master/examples/complete)

## Inputs

| Name                  | Description                                                                            |  Type  |        Default         | Required |
| --------------------- | -------------------------------------------------------------------------------------- | :----: | :--------------------: | :------: |
| assume_role_policy    | The policy that grants an entity permission to assume the role.                        | string |           -            |   yes    |
| name                  | The name of the role. If omitted, Terraform will assign a random, unique name.         | string |           -            |   yes    |
| policy                | The policy document. This is a JSON formatted string.                                  | string |           -            |   yes    |
| description           | The description of the role and the policy.                                            | string | `Managed by Terraform` |    no    |
| force_detach_policies | Specifies to force detaching any policies the role has before destroying it.           | string |        `false`         |    no    |
| max_session_duration  | The maximum session duration (in seconds) that you want to set for the specified role. | string |         `3600`         |    no    |
| path                  | Path in which to create the role and the policy.                                       | string |          `/`           |    no    |

## Outputs

| Name                   | Description                                         |
| ---------------------- | --------------------------------------------------- |
| iam_policy_arn         | The ARN assigned by AWS to this policy.             |
| iam_policy_description | The description of the policy.                      |
| iam_policy_document    | The policy document.                                |
| iam_policy_id          | The policy's ID.                                    |
| iam_policy_name        | The name of the policy.                             |
| iam_policy_path        | The path of the policy in IAM.                      |
| iam_role_arn           | The Amazon Resource Name (ARN) specifying the role. |
| iam_role_create_date   | The creation date of the IAM role.                  |
| iam_role_description   | The description of the role.                        |
| iam_role_name          | The name of the role.                               |
| iam_role_unique_id     | The stable and unique string identifying the role.  |

## Development

### Development Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-iam-role.git
cd terraform-aws-iam-role
make install
```

### Makefile targets

```text
apply-complete                 Run terraform apply examples/complete
apply-minimal                  Run terraform apply examples/minimal
bump-version                   Bump version (Required argument 'VERSION')
check-format                   Check format code
clean                          Clean .terraform
destroy-complete               Run terraform destroy examples/complete
destroy-minimal                Run terraform destroy examples/minimal
diff                           Word diff
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
plan-complete                  Run terraform plan examples/complete
plan-minimal                   Run terraform plan examples/minimal
release                        Release GitHub and Terraform Module Registry
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/iam-role/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
