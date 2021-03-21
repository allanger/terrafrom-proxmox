resource "random_pet" "master" {
  count  = var.masters_count
  length = 3
  prefix = "master"
}

resource "random_pet" "worker" {
  count  = var.workers_count
  length = 3
  prefix = "worker"
}

