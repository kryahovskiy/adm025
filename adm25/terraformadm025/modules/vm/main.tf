resource "yandex_compute_instance" "vm" {
  count = length(var.vm_names)
  folder_id = var.folder_id
  name = var.vm_names[count.index]
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue7aajpmeo39kk"  # ID образа Ubuntu 22.04
      size     = var.boot_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("${path.module}/keys/id_rsa.pub")}"
  }
}

output "vm_names" {
  value = var.vm_names
}

output "vm_ips" {
  value = [for vm in yandex_compute_instance.vm : vm.network_interface.0.nat_ip_address]
}
