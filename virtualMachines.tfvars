resource_group_name = "gws-rg"
location            = "West US"

virtual_network_name    = "gws-vnet"
virtual_network_address = "10.0.0.0/16"

subnet_name    = "gws-subnet"
subnet_address = "10.0.2.0/24"

network_interface = [{
  network_interface_name        = "gws-nic0"
  ip_configuration_name         = "ipconfig1"
  private_ip_address_allocation = "Dynamic"
  },

  { network_interface_name        = "gws-nic1"
    ip_configuration_name         = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
  },

  { network_interface_name        = "gws-nic2"
    ip_configuration_name         = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
  }
]


#admin definitions
virtual_machine = [{
  name                  = "VM0"
  location              = "West US"
  resource_group_name   = "gws-rg"
  network_interface_ids = "nic0"
  vm_size               = "Standard_B2s"
  publisher             = "MicrosoftWindowsServer"
  offer                 = "WindowsServer"
  sku                   = "2019-datacenter-gensecond"
  version               = "latest"
  os_disk_name          = "myosdisk1"
  caching               = "ReadWrite"
  create_option         = "FromImage"
  managed_disk_type     = "Standard_LRS"
  computer_name         = "hostname"
  admin_username        = "testadmin"
  admin_password        = "Password1234"

  },
  {
    name                  = "VM1"
    location              = "West US"
    resource_group_name   = "gws-rg"
    network_interface_ids = "nic1"
    vm_size               = "Standard_B2s"
    publisher             = "MicrosoftWindowsServer"
    offer                 = "WindowsServer"
    sku                   = "2019-datacenter-gensecond"
    version               = "latest"
    os_disk_name          = "yosdisk1"
    caching               = "ReadWrite"
    create_option         = "FromImage"
    managed_disk_type     = "Standard_LRS"
    computer_name         = "hostname"
    admin_username        = "testadmin"
    admin_password        = "Password1234"
  },
  {
    name                  = "VM2"
    location              = "West US"
    resource_group_name   = "gws-rg"
    network_interface_ids = "nic2"
    vm_size               = "Standard_B2s"
    publisher             = "MicrosoftWindowsServer"
    offer                 = "WindowsServer"
    sku                   = "2019-datacenter-gensecond"
    version               = "latest"
    os_disk_name          = "yosdisk2"
    caching               = "ReadWrite"
    create_option         = "FromImage"
    managed_disk_type     = "Standard_LRS"
    computer_name         = "hostname"
    admin_username        = "testadmin"
    admin_password        = "Password1234"
  }
]


network_security_group_name = "acceptanceTestSecurityGroup1"
#location                   = "West US"
#resource_group_name        = "gws-rg"
security_rule_name         = "test123"
priority                   = 100
direction                  = "Inbound"
access                     = "Allow"
protocol                   = "*"
source_port_range          = "*"
destination_port_range     = "*"
source_address_prefix      = "*"
destination_address_prefix = "*"
