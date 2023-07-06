variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to create the storage account"
}

variable "suffix" {
  type        = string
  description = "Optional suffix that would be added to the end of resources names. It is recommended to use dash at the beginning of variable (e.x., '-example')"
  default     = ""
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "custom_virtual_machine_name" {
  type        = string
  description = "Specifies the name of the virtual machine name resource"
  default     = null
}

variable "custom_network_interface_name" {
  type        = string
  description = "Specifies the name of the virtual machine interface name resource"
  default     = null
}

variable "custom_public_ip_name" {
  type        = string
  description = "Specifies the name of the public ip name name resource"
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "Resource tags"
  default     = {}
}

variable "allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  default     = "Dynamic"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located in."
}

variable "network_interface" {
  type = object({
    private_ip_address_allocation = string
    public_ip_enabled             = bool
  })
  description = "Objects to configure network interface"
  default = {
    private_ip_address_allocation = "Dynamic"
    public_ip_enabled             = true
  }
}

variable "virtual_machine" {
  type = object({
    size           = string
    admin_username = string
  })
  description = "Objects to configure virtual_machine"
  default = {
    size           = "Standard_F2"
    admin_username = "adminuser"
  }
}

variable "admin_ssh_key" {
  type = object({
    username   = string
    public_key = string
  })
  description = "Objects to configure ssh key reference for virtual machine"
}

variable "os_disk" {
  type = object({
    caching              = string
    storage_account_type = string
  })
  description = "Objects to configure os disk reference for virtual machine"
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "Objects to configure source image reference for virtual machine"
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

variable "password_access_enable" {
  type        = bool
  description = "Password access enable"
  default     = true
}
