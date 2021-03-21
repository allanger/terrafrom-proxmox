resource "proxmox_vm_qemu" "k8s_node" {
  count       = var.workers_count
  name        = random_pet.worker[count.index].id
  target_node = "pve"

  clone = "ubuntu-2004-cloudinit-template"

  os_type  = "cloud-init"
  cores    = 2
  sockets  = "1"
  cpu      = "host"
  memory   = 4026
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    size    = "10G"
    type    = "scsi"
    storage = "zpool"
  }

  disk {
    size    = "30G"
    type    = "scsi"
    storage = "zpool"
  }


  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.31.10${count.index + 1}/24,gw=192.168.31.72"
  ciuser    = "overlord"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF
}
