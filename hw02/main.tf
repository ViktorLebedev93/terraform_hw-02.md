# Создаем VPC сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Создаем subnet в зоне ru-central1-a (для web VM)
resource "yandex_vpc_subnet" "develop_a" {
  name           = "develop-a"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

# Создаем subnet в зоне ru-central1-b (для db VM)
resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-b"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

# Получаем образ Ubuntu
data "yandex_compute_image" "ubuntu" {
  family = var.family_name
}

# Создаем Web VM
resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_instance_name
  platform_id = var.vm_web_platform_id
  zone        = var.default_zone

  # ИЗМЕНЕНИЕ: используем map-переменную вместо отдельных переменных
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vm_web_hw_disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_hw_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_a.id
    nat       = var.vm_web_hw_nat
  }

  # ИЗМЕНЕНИЕ: используем общую map-переменную для metadata
  metadata = var.vm_common_metadata
}

# Создаем DB VM
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_instance_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  # ИЗМЕНЕНИЕ: используем map-переменную вместо отдельных переменных
  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vm_db_hw_disk_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_hw_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = var.vm_db_hw_nat
  }

  # ИЗМЕНЕНИЕ: используем общую map-переменную для metadata
  metadata = var.vm_common_metadata
}
