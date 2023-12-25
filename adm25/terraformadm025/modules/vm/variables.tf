variable "folder_id" {
  description = "Folder ID where the VM will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM network interface"
  type        = string
}

variable "vm_names" {
  description = "List of VM names"
  type        = list(string)
}

variable "boot_disk_size" {
  description = "The size of the boot disk in GB"
  type        = number
  default     = 30  # Устанавливаем значение по умолчанию в 30 ГБ
}