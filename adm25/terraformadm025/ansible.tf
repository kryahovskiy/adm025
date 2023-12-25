resource "null_resource" "ansible_inventory" {
  depends_on = [module.vm]

  provisioner "local-exec" {
    command = "echo '[default]' > ${path.module}/ansible/inventory"
  }
}

resource "local_file" "inventory_file" {
  depends_on = [null_resource.ansible_inventory]

  filename = "${path.module}/ansible/inventory"
  content  = join("\n", formatlist("%s ansible_ssh_user=ubuntu", module.vm.vm_ips))
}
