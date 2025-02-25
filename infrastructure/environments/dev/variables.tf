variable "location" {
  description = "Azure régió"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Környezet típusa"
  type        = string
  default     = "dev"
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