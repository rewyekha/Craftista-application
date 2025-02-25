variable "registry_name" {
  description = "Azure Container Registry neve"
  type        = string
}

variable "resource_group_name" {
  description = "Az erőforráscsoport neve"
  type        = string
}

variable "location" {
  description = "Azure régió"
  type        = string
}

variable "sku" {
  description = "ACR SKU típusa"
  type        = string
}

variable "admin_enabled" {
  description = "Adminisztrátori hozzáférés engedélyezése"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Erőforrás címkék"
  type        = map(string)
  default     = {}
}
