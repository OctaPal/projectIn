terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "example" {
  name     = "octavio-group"

}


#------- VIRTUAL NETWORK -----------#
resource "azurerm_virtual_network" "main" {
  name                = "octapal-network"
  address_space       = ["10.1.0.0/16"]
  location            = "East US"
  resource_group_name = "octavio-group" 
} 
