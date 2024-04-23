variable "sp" {
  type = object({
    app_id          = string,
    display_name    = string,
    password        = string,
    tenant          = sting,
    subscription_id = string,
  })
  description = "Azure Service Principal"
  nullable    = false
  sensitive   = true
}

