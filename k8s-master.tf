# resource "proxmox_vm_qemu" "k8s_server" {
#   count       = var.masters_count
#   name        = random_pet.master[count.index].id
#   target_node = "pve"
#   clone       = "ubuntu-2004-cloudinit-template"
#   os_type     = "cloud-init"
#   cores       = 2
#   sockets     = "1"
#   cpu         = "host"
#   memory      = 4026
#   scsihw      = "virtio-scsi-pci"
#   bootdisk    = "scsi0"
  
#   disk {
#     size    = "15G"
#     type    = "scsi"
#     storage = "zpool"
#   }

#   network {
#     model  = "virtio"
#     bridge = "vmbr0"
#   }
#   lifecycle {
#     ignore_changes = [
#       network,
#     ]
#   }

#   ipconfig0 = "ip=10.42.82.100/24,gw=192.168.31.72"
#   ciuser    = "overlord"
#   sshkeys   = <<EOF
#   ${var.ssh_key}
#   EOF
# }
