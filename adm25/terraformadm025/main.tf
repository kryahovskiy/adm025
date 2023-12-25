terraform {
  required_providers {
    yandex = {
      source  = "terraform-registry.storage.yandexcloud.net/yandex-cloud/yandex"
    }
  }
}

module "cloud" {
  source = "./modules/cloud"
  # Каталог с информацией о провайдере
}

module "folder" {
  source = "./modules/folder"
  # Работа с провайдером
}

module "vpc" {
  source = "./modules/vpc"
  folder_id = module.folder.folder_id
}

module "vm" {
  source = "./modules/vm"
  folder_id = module.folder.folder_id
  subnet_id = module.vpc.subnet_id
  vm_names = local.vm_names
}

# Чтение файла `computers`
data "local_file" "computers" {
  filename = "${path.module}/computers.txt"
}

locals {
  raw_vm_names = split("\n", trimspace(data.local_file.computers.content))
  vm_names = [for name in local.raw_vm_names : trimspace(replace(name, "\r", ""))]
}