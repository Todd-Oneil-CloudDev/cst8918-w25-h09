variable "region" {
  type = string
  description = "location of created resources"
  default = "canadacentral"
}

variable "prefix" {
  type = string
  description = "resource prefix tag"
  default = "onei0240"
}

variable "admin_username" {
  type        = string
  default     = "azureadmin"
  description = "The username for the local user account on the VM."
}