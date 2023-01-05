terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    random = {
      source="hashicorp/random"
    }
    null = {
      source = "hashicorp/null"
    }
    
  }
  backend "azurerm" {
      resource_group_name = "terraformstorage"
      storage_account_name = "terraformtfstate009"
      container_name = "terraformstate201"
      key = "project-1-eastus-teraform.tfstate"
    }
}

provider "azurerm" {
  features {}
}
