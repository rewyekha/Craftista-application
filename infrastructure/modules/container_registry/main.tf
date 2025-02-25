module "container_registry" {
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.4.0"

  name                    = var.registry_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  sku                     = var.sku
  admin_enabled           = var.admin_enabled
  tags                    = var.tags
  zone_redundancy_enabled = false
  retention_policy_in_days = null
}
