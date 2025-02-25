variable "location" {
  description = "Azure régió"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Környezet típusa"
  type        = string
  default     = "shared"
}

variable "project_name" {
  description = "Projekt neve"
  type        = string
  default     = "craftista"
}

variable "tags" {
  description = "Resource címkék"
  type        = map(string)
  default     = {}
}

variable "acr_sku" {
  description = "Azure Container Registry SKU típusa"
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Adminisztrátori hozzáférés engedélyezése"
  type        = bool
  default     = false
}
