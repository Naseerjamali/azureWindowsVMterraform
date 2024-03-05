variable "resource_group_name" {
  type    = string
  default = "gws-rg"
}

variable "location" {
  type    = string
  default = "West US"
}


variable "virtual_network_name" {
  type = string
}

variable "virtual_network_address" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_address" {
  type = string
}


variable "network_interface" {
  type = list(object({
    network_interface_name        = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
  }))
}



variable "virtual_machine" {
  type = list(object({
    name                  = string
    location              = string
    resource_group_name   = string
    network_interface_ids = string
    vm_size               = string
    publisher             = string
    offer                 = string
    sku                   = string
    version               = string
    os_disk_name          = string
    caching               = string
    create_option         = string
    managed_disk_type     = string
    computer_name         = string
    admin_username        = string
    admin_password        = string
  }))

}

# variable "network_security_group" {
#   type = list(string({
#     name                       = string
#     location                   = string
#     resource_group_name        = string
#     security_rule_name         = string
#     priority                   = number
#     direction                  = string
#     access                     = string
#     protocol                   = string
#     source_port_range          = string
#     destination_port_range     = string
#     source_address_prefix      = string
#     destination_address_prefix = string
#   }))
# }

variable "network_security_group_name" {
  type = string
}

variable "security_rule_name" {
  type = string
}
variable "priority" {
  type = number
}
variable "direction" {
  type = string
}
variable "access" {
  type = string
}
variable "protocol" {
  type = string
}
variable "source_port_range" {
  type = string
}
variable "destination_port_range" {
  type = string
}
variable "source_address_prefix" {
  type = string
}
variable "destination_address_prefix" {
  type = string
}