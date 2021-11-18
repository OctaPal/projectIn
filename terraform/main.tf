data "azurerm_resource_group" "my-rg" {
  name = "tfstaterg"
}


resource "azurerm_virtual_network" "network" {
  name                = "${var.prefix}-vn-act3"
  address_space       = ["10.1.0.0/16"]
  location            = data.azurerm_resource_group.my-rg.location
  resource_group_name = data.azurerm_resource_group.my-rg.name
}


resource "azurerm_subnet" "example" {
  name                 = "subnet-act3"
  resource_group_name  = data.azurerm_resource_group.my-rg.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = ["10.1.2.0/24"]
}

resource "azurerm_network_security_group" "example" {
  name                = "nsg-ac2"
  location            = data.azurerm_resource_group.my-rg.location
  resource_group_name = data.azurerm_resource_group.my-rg.name

  security_rule {
    name                       = "testac2"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "dev"
  }
}