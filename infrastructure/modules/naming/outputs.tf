output "resource_group_name" {
  value = "${module.naming_convention.resource_group.name}-${random_string.unique_suffix.result}"
}

output "naming_module" {
  value = module.naming_convention
}

output "container_registry_name" {
  value = "${module.naming_convention.container_registry.name}${random_string.unique_suffix.result}"
}

output "shared_resource_group_name" {
  description = "A shared resource group neve"
  value       = "${module.naming_convention.resource_group.name}-${random_string.unique_suffix.result}"
}