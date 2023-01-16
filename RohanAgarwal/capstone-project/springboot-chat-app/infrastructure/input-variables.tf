variable "business_division" {
  description = "Business Division "
  type        = string
  default     = "retail"

}

variable "environment" {
  type    = string
  default = "dev"
}

variable "resource_group" {
  type    = string
  default = "rg-default"
}

variable "vm_name" {
  type    = string
  default = "web-linuxvm"
}

variable "resource_group_location" {
  type    = string
  default = "eastus"
}
