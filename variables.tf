variable "name" {}
variable "path" {
  default = "/"
}

variable "assume_role_services" {
  description = "List of AWS servicees allowed to assume this role."
  type        = list(string)
  default     = []
}

variable "assume_role_arns" {
  description = "List of AWS identity ARNs allowed to assume this role."
  type        = list(string)
  default     = []
}

variable "assume_role_policy" {
  description = "Assume role policy, default: null"
  default     = null

  type = object({
    json = string
  })
}

variable "managed_policy_arns" {
  description = "List of IAM policy ARNs for this role."
  type        = list(string)
  default     = []
}

variable "access_policy" {
  description = "Access policy, default: null"

  type = object({
    json = string
  })

  default = null
}

variable "instance_profile" {
  description = "Indicates if aws_iam_instance_profile should be created for this role."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Role tags."
  type        = map(string)
  default     = {}
}
