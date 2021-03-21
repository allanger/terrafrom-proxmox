terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.6.7"
    }
  }
}

variable "pm_api_url" {
  default = "https://localhost:8006/api2/json"
}

variable "pm_user" {
  default = "root"
}

variable "pm_password" {
  default = "root"
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINBpbtCNdOoZzbFUaIuwBOzHIJW2lyjQwxNnXosSuPdt allanger@drugstore"
}

provider "proxmox" {
  pm_parallel       = 4
  pm_tls_insecure   = true
  pm_api_url        = var.pm_api_url
  pm_password       = var.pm_password
  pm_user           = var.pm_user
}