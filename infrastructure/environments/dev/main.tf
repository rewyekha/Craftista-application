terraform {
  backend "azurerm" {
    resource_group_name  = "craftista-shared-rg"
    storage_account_name = "craftistastate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a3567db7-3d56-4792-81f0-6ad0627e336e"
}

module "naming" {
  source = "../../modules/naming"
  
  environment    = var.environment
  project_name   = var.project_name
}

module "resource_group" {
  source = "../../modules/resource_group"
  
  location            = var.location
  resource_group_name = module.naming.resource_group_name
  tags                = var.tags
}