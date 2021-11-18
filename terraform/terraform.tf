terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaterg"
    storage_account_name = "tfstateac"
    container_name       = "tfstatecn"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = "~> 2.0"
  }
}
