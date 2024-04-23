variable "sp" {
  type = object({
    app_id          = string,
    display_name    = string,
    password        = string,
    tenant          = string,
    subscription_id = string,
  })
  description = "Azure Service Principal"
  nullable    = false
  sensitive   = true
}

