variable "name" {
  description = "The name of the IAM role."
}

variable "path" {
  description = "The path of IAM role."
  default     = "/"
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

variable "max_session_duration" {
  description = "Maximum session duration in seconds."
  type        = number
  default     = 3600
}

variable "force_detach_policies" {
  description = "Indicates if policies should be detached before destroying."
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of IAM role"
  default     = ""
}

variable "permissions_boundary" {
  description = "The ARN of permission boundary policy."
  default     = ""
}

variable "wait_for_policy" {
  type    = bool
  default = true
}
