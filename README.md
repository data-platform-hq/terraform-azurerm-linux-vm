# Azure linux vm Terraform module
Terraform module for creation Azure linux vm

## Usage

```hcl
# Prerequisite resources

data "azurerm_resource_group" "example" {
  name                = "example"
}

data "azurerm_subnet" "example" {
  name                 = "example"
  virtual_network_name = "production"
  resource_group_name  = data.azurerm_resource_group.example.name
}

resource "tls_private_key" "example" {
  algorithm   = "RSA"
  ecdsa_curve = 2048
}

module "linux_virtual_machine" {
  source   = "data-platform-hq/linux-vm/azurerm"
  version  = "~> 1.0"

  project        = var.project
  env            = var.env
  resource_group = data.azurerm_resource_group.example.name
  location       = var.location
  subnet_id      = data.azurerm_subnet.example.id
  
  admin_ssh_key = {
    username   = "userexample"
    public_key = tls_private_key.example.public_key_openssh
  }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_ssh_key"></a> [admin\_ssh\_key](#input\_admin\_ssh\_key) | Objects to configure ssh key reference for virtual machine | <pre>object({<br>    username   = optional(string, "adminuser")<br>    public_key = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_custom_network_interface_name"></a> [custom\_network\_interface\_name](#input\_custom\_network\_interface\_name) | Specifies the name of the virtual machine interface name resource | `string` | `null` | no |
| <a name="input_custom_public_ip_name"></a> [custom\_public\_ip\_name](#input\_custom\_public\_ip\_name) | Specifies the name of the public ip name name resource | `string` | `null` | no |
| <a name="input_custom_virtual_machine_name"></a> [custom\_virtual\_machine\_name](#input\_custom\_virtual\_machine\_name) | Specifies the name of the virtual machine name resource | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | n/a | yes |
| <a name="input_identity_enabled"></a> [identity\_enabled](#input\_identity\_enabled) | Boolean flag than enables creation of System Assigned identity to VM | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location | `string` | n/a | yes |
| <a name="input_network_interface_private_ip_address_allocation"></a> [network\_interface\_private\_ip\_address\_allocation](#input\_network\_interface\_private\_ip\_address\_allocation) | The allocation method used for the Private IP Address. | `string` | `"Dynamic"` | no |
| <a name="input_os_disk"></a> [os\_disk](#input\_os\_disk) | Objects to configure os disk reference for virtual machine | <pre>object({<br>    caching              = string<br>    storage_account_type = string<br>  })</pre> | <pre>{<br>  "caching": "ReadWrite",<br>  "storage_account_type": "Standard_LRS"<br>}</pre> | no |
| <a name="input_password_access_enabled"></a> [password\_access\_enabled](#input\_password\_access\_enabled) | Boolean flag that enables access using password | `bool` | `false` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | n/a | yes |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic | `string` | `"Static"` | no |
| <a name="input_public_ip_enabled"></a> [public\_ip\_enabled](#input\_public\_ip\_enabled) | Boolean flag to enable Public Ip address creation and assignment to Virtual Machine | `bool` | `true` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group | `string` | n/a | yes |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | Objects to configure source image reference for virtual machine | <pre>object({<br>    publisher = string<br>    offer     = string<br>    sku       = string<br>    version   = string<br>  })</pre> | <pre>{<br>  "offer": "0001-com-ubuntu-server-jammy",<br>  "publisher": "Canonical",<br>  "sku": "22_04-lts",<br>  "version": "latest"<br>}</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet where this Network Interface should be located in. | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Optional suffix that would be added to the end of resources names. It is recommended to use dash at the beginning of variable (e.x., '-example') | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(any)` | `{}` | no |
| <a name="input_vm_admin_password"></a> [vm\_admin\_password](#input\_vm\_admin\_password) | The password of the local administrator used for the Virtual Machine. | `string` | `null` | no |
| <a name="input_vm_admin_username"></a> [vm\_admin\_username](#input\_vm\_admin\_username) | The username of the local administrator used for the Virtual Machine. | `string` | `"adminuser"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The SKU which should be used for this Virtual Machine. | `string` | `"Standard_F2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Linux Virtual Machine |
| <a name="output_identity"></a> [identity](#output\_identity) | linux virtual machine Identities list |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Linux Virtual Machine private IP address |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Linux Virtual Machine public IP address |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-linux-vm/blob/main/LICENSE)
