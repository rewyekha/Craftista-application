terraform {
  backend "azurerm" {
    resource_group_name  = "craftista-shared-rg"
    storage_account_name = "craftistastate"
    container_name       = "tfstate"
    key                  = "shared.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a3567db7-3d56-4792-81f0-6ad0627e336e"
}

module "naming" {
  source = "../../modules/naming"

  environment   = var.environment
  project_name  = var.project_name
}

module "shared_resource_group" {
  source  = "../../modules/resource_group"

  location            = var.location
  resource_group_name = module.naming.shared_resource_group_name
  tags                = var.tags
}


module "container_registry" {
  source  = "../../modules/container_registry"

  resource_group_name = module.shared_resource_group.resource_group_name
  location            = var.location
  registry_name       = module.naming.container_registry_name
  sku                 = var.acr_sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags
}