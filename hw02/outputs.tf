# Output для задания 4
output "vm_instances" {
  description = "Information about created virtual machines"
  value = {
    web = {
      instance_name = yandex_compute_instance.platform_web.name
      external_ip   = yandex_compute_instance.platform_web.network_interface.0.nat_ip_address
      fqdn          = yandex_compute_instance.platform_web.fqdn
    }
    db = {
      instance_name = yandex_compute_instance.platform_db.name
      external_ip   = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
      fqdn          = yandex_compute_instance.platform_db.fqdn
    }
  }
}

# Output для проверки задания 6
output "vms_resources_config" {
  description = "VM resources configuration from map variable"
  value       = var.vms_resources
}

output "vm_common_metadata_config" {
  description = "Common metadata configuration"
  value       = var.vm_common_metadata
  sensitive   = true
}
