variable "prefix" {
  type        = string
  default     = "tf-conn-"
  nullable    = false
  description = "the prefix will apply to all resource name"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "resource location"
}

variable "sp" {
  type = object({
    app_id          = string,
    display_name    = string,
    password        = string,
    tenant          = string,
    subscription_id = string,
  })
  default     = null
  description = "Azure Service Principal"
  nullable    = true
  sensitive   = true
}

variable "tags" {
  type = object({
    of    = string,
    usage = string,
  })
  default = {
    of    = "tf"
    usage = "test"
  }
  description = "common tags to mark resource belonging"
  nullable    = true
}

# ================ VM CONFIGURATION ================ 

variable "vmsize" {
  type        = string
  default     = "Standard_DS1_v2"
  nullable    = true
  description = "the size of the vm, see: https://github.com/Huachao/azure-content/blob/master/articles/virtual-machines/virtual-machines-size-specs.md"
}

variable "vmuser" {
  type        = string
  default     = "admin"
  nullable    = true
  description = "the user name of the vm os profile"
}

variable "vmpasswd" {
  type        = string
  default     = "123456"
  nullable    = true
  description = "the password of the user of vm os profile"
}


variable "vmospub" {
  type        = string
  default     = "Canonical"
  nullable    = true
  description = "the vm os publisher, see: https://az-vm-image.info/"
}

variable "vmosoffer" {
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  nullable    = true
  description = "the vm os offer, see: https://az-vm-image.info/"
}

variable "vmossku" {
  type        = string
  default     = "22_04-lts"
  nullable    = true
  description = "the vm os sku, see: https://az-vm-image.info/"
}

variable "vmosversion" {
  type        = string
  default     = "latest"
  nullable    = true
  description = "the vm os version, see: https://az-vm-image.info/"
}

