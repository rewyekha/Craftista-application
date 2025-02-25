variable "resource_group_name" {
  description = "Erőforráscsoport neve"
  type        = string
}

variable "location" {
  description = "Azure régió"
  type        = string
}

variable "tags" {
  description = "Erőforrás címkék"
  type        = map(string)
  default     = {}
}