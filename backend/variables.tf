variable "prefix" {
  type        = string
  default     = "tf"
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
    usage = "backend-storage"
  }
  description = "common tags to mark resource belonging"
  nullable    = true
}
