variable "business_division" {
  description = "Business Division"
  type = string
  default = "hr"
}

variable "environment" {
  type = string
  default = "dev"
}
variable "resource_group" {
  type = string 
  default = "rg-default"
}

variable "resource_group_location" {
  type = string 
  default = "eastus"
}

variable "vnet_name" {
  type = string
  default = "vnet-default"
}

variable "vnet_address_space" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}

variable "web_subnet_name" {
  type = string
  default = "websubnet"
}

variable "web_subnet_address" {
  type = list(string)
  default = [ "10.0.1.0/24" ]
}

variable "app_subnet_name" {
  type = string
  default = "appsubnet"
}

variable "app_subnet_address" {
  type = list(string)
  default = [ "10.0.2.0/24" ]
}

variable "bastion_subnet_name" {
  type = string
  default = "bastionsubnet"
}

variable "bastion_subnet_address" {
  type = list(string)
  default = [ "10.0.100.0/24" ]
}

variable "bastion_service_subnet_name" {
type = string
  default = "AzureBastionSubnet"
}
variable "bastion_service_address_prefixes" {
     type = list(string)
  default = ["10.0.101.0/27"]
}

variable "source_address_range" {
     type = string
  default = "10.0.101.0/32"
}