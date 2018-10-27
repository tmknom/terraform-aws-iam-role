# Input Variable Configuration
#
# https://www.terraform.io/docs/configuration/variables.html

variable "name" {
  type        = "string"
  description = "The name of the role. If omitted, Terraform will assign a random, unique name."
}

variable "assume_role_policy" {
  type        = "string"
  description = "The policy that grants an entity permission to assume the role."
}

variable "policy" {
  type        = "string"
  description = "The policy document. This is a JSON formatted string."
}

variable "path" {
  default     = "/"
  type        = "string"
  description = "Path in which to create the role and the policy."
}

variable "description" {
  default     = "Managed by Terraform"
  type        = "string"
  description = "The description of the role and the policy."
}

variable "max_session_duration" {
  default     = "3600"
  type        = "string"
  description = "The maximum session duration (in seconds) that you want to set for the specified role."
}
