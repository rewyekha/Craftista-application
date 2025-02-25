module "naming_convention" {
  source  = "Azure/naming/azurerm"
  version = "0.4.0"

  prefix        = [var.environment, var.project_name]
  unique-length = 0
}

resource "random_string" "unique_suffix" {
  length  = 4
  special = false
  upper   = false
  numeric = true
}