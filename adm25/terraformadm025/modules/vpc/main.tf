resource "yandex_vpc_network" "my_network" {
  folder_id = var.folder_id
  name      = "my-network"
}

resource "yandex_vpc_subnet" "my_subnet" {
  name           = "my-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  folder_id      = var.folder_id
}
