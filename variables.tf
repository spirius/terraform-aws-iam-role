variable "name" {}
variable "path" {
  default = null
}

variable "assume_role_services" {
  default = null
  type    = list(string)
}

variable "assume_role_arns" {
  default = null
  type    = list(string)
}

variable "assume_role_policy" {
  default = "{}"
}

variable "managed_policies" {
  type = list(string)
}

variable "access_policy" {
  default = null
}

variable "instance_profile" {
  type    = bool
  default = false
}

variable "tags" {
  type = map(string)
}
