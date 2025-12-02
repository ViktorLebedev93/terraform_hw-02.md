# Минимальный locals.tf для задания
locals {
  # Имена ВМ с использованием интерполяции нескольких переменных
  vm_web_instance_name = "vm-${var.vm_web_name}-${var.default_zone}-${var.vpc_name}"
  vm_db_instance_name  = "vm-${var.vm_db_name}-${var.vm_db_zone}-${var.vpc_name}"
}
