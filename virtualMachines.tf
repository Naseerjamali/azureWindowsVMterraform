resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_address]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet_address]
}


resource "azurerm_public_ip" "example" {
  count               = length(var.network_interface)
  name                = "ip${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"


}

resource "azurerm_network_interface" "example" {
  count               = length(var.network_interface)
  name                = var.network_interface[count.index].network_interface_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = var.network_interface[count.index].ip_configuration_name
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example[count.index].id
  }
}

resource "azurerm_virtual_machine" "example" {
  count               = length(var.virtual_machine)
  name                = var.virtual_machine[count.index].name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  vm_size             = var.virtual_machine[count.index].vm_size
  #admin_username      = "adminuser"
  #admin_password      = "1234hello!"
  network_interface_ids = [
  azurerm_network_interface.example[count.index].id]
  #disable_password_authentication = false
  # os_disk {
  #   caching              = "ReadWrite"
  #   storage_account_type = "Standard_LRS"
  # }


  #custom_data = filebase64("cloud-init.txt")
  #user_data = base64encode(file("userdata.tftpl"))

  storage_image_reference {
    publisher = var.virtual_machine[count.index].publisher
    offer     = var.virtual_machine[count.index].offer
    sku       = var.virtual_machine[count.index].sku
    version   = var.virtual_machine[count.index].version
  }
  storage_os_disk {
    name              = var.virtual_machine[count.index].os_disk_name
    caching           = var.virtual_machine[count.index].caching
    create_option     = var.virtual_machine[count.index].create_option
    managed_disk_type = var.virtual_machine[count.index].managed_disk_type
  }
  os_profile {
    computer_name  = var.virtual_machine[count.index].computer_name
    admin_username = var.virtual_machine[count.index].admin_username
    admin_password = var.virtual_machine[count.index].admin_password
    #custom_data    = filebase64("directory.ps1")

  }
  delete_os_disk_on_termination = true


  os_profile_windows_config {
    provision_vm_agent = true

  }
}

resource "azurerm_network_security_group" "example" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = var.security_rule_name
    priority                   = var.priority
    direction                  = var.direction
    access                     = var.access
    protocol                   = var.protocol
    source_port_range          = var.source_port_range
    destination_port_range     = var.destination_port_range
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix
  }
}
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}
