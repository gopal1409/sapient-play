resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.resource_group_location
  tags     = local.common_tags
}

resource "random_string" "myrandom" {
  length  = 5
  upper   = false
  special = false
  numeric = false
}
