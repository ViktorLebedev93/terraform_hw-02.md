### Ex.2 vars

variable "family_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство устанавливаемой ОС"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Имя виртуальной машины"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "ID виртуальной платформы"
}

# variable "vm_web_hw_cores" {
#   type = number
#   default = 2
#   description = "Количество виртуальных ядер"
# }

# variable "vm_web_hw_memory" {
#   type = number
#   default = 1
#   description = "Объем оперативной памяти"
# }

# variable "vm_web_core_frac" {
#   type = number
#   default = 20
#   description = "Ограничение пиковой производительности CPU"
# }

variable "vm_web_hw_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемость работы ВМ"
}
variable "vm_web_hw_nat" {
  type        = bool
  default     = true
  description = "Активировать NAT"
}
variable "vm_web_hw_serial_port_enable" {
  type        = number
  default     = 1
  description = "Активировать серийный порт для удаленного доступа"
}

# Variables for DB VM (vm_db_)
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Имя виртуальной машины для базы данных"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "ID виртуальной платформы для DB VM"
}

# variable "vm_db_hw_cores" {
#   type        = number
#   default     = 2
#   description = "Количество виртуальных ядер для DB VM"
# }

# variable "vm_db_hw_memory" {
#   type        = number
#   default     = 2
#   description = "Объем оперативной памяти для DB VM"
# }

# variable "vm_db_core_frac" {
#   type        = number
#   default     = 20
#   description = "Ограничение пиковой производительности CPU для DB VM"
# }

variable "vm_db_hw_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемость работы DB VM"
}

variable "vm_db_hw_nat" {
  type        = bool
  default     = true
  description = "Активировать NAT для DB VM"
}

variable "vm_db_hw_serial_port_enable" {
  type        = number
  default     = 1
  description = "Активировать серийный порт для удаленного доступа DB VM"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона доступности для DB VM"
}

# Disk size variables
variable "vm_web_hw_disk_size" {
  type        = number
  default     = 15
  description = "Boot disk size in GB for Web VM"
}

variable "vm_db_hw_disk_size" {
  type        = number
  default     = 15
  description = "Boot disk size in GB for DB VM"
}

# SSH variable (старая - ЗАКОММЕНТИРОВАТЬ)
# variable "vms_ssh_root_key" {
#   type        = string
#   description = "ssh-keygen -t ed25519 or rsa"
#   default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvcG8Vf7p3y2uZoqeWojRC6QEsW25sJ7qTk+078OUKWzxOKHok5jmD7t/fZ8A82D6H5dlSHwN0e8SEnWqSuCxBn5vNfljaGNl2gg8rN4n5f9pZYOmi6naEvH3tkX19fSjJY3Yh9WFvjZ5lR+lkCryDxqDxLkH0tawxqumhQpyEnhVd1ljU17+ArZfTrx0Mg3j7J9EhGVaoan3MMuN1mGdA2aBUeDKC85Sh7oE35JuoRuRiFUalCwG4xEB0KjvMJFs3L2yAm2bPBRfkooxiHGEIKOxNvbeFdhixtcHTKg4L1k9lnE5MMix25Trod2xnOLnRIve0tQ62jHeUtzdsBKut viktor-rsa-key-20250120"
# }

### ЗАДАНИЕ 6 - новые map переменные

# Map variable for VM resources
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))

  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

# Common metadata for all VMs
variable "vm_common_metadata" {
  type = map(string)

  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvcG8Vf7p3y2uZoqeWojRC6QEsW25sJ7qTk+078OUKWzxOKHok5jmD7t/fZ8A82D6H5dlSHwN0e8SEnWqSuCxBn5vNfljaGNl2gg8rN4n5f9pZYOmi6naEvH3tkX19fSjJY3Yh9WFvjZ5lR+lkCryDxqDxLkH0tawxqumhQpyEnhVd1ljU17+ArZfTrx0Mg3j7J9EhGVaoan3MMuN1mGdA2aBUeDKC85Sh7oE35JuoRuRiFUalCwG4xEB0KjvMJFs3L2yAm2bPBRfkooxiHGEIKOxNvbeFdhixtcHTKg4L1k9lnE5MMix25Trod2xnOLnRIve0tQ62jHeUtzdsBKut viktor-rsa-key-20250120"
  }
}
