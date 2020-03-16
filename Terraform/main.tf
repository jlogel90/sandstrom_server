variable "vsphere_user" {
    type = string
}
variable "vsphere_password" {
    type = string
}
variable "vsphere_server" {
    type = string
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  # ESXi Host Default Datacenter Name
  name = "ha-datacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  # ESXi Host Default Resource Pool Name
  name          = "ha-root-pool"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm1" {
  name             = "Code"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus                   = 1
  memory                     = 4096
  guest_id                   = "ubuntu64Guest"
  wait_for_guest_net_timeout = -1

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 25
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "ISOs/Ubuntu/ubuntu-18.04.4-desktop-amd64.iso"
  }
}
  
resource "vsphere_virtual_machine" "vm2" {
  name             = "Deploy"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus                   = 2
  memory                     = 6144
  guest_id                   = "ubuntu64Guest"
  wait_for_guest_net_timeout = -1

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 50
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "ISOs/Ubuntu/ubuntu-18.04.4-live-server-amd64.iso"
  }
}
  
resource "vsphere_virtual_machine" "vm3" {
  name             = "Test"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus                   = 2
  memory                     = 8192
  guest_id                   = "ubuntu64Guest"
  wait_for_guest_net_timeout = -1

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 70
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "ISOs/Ubuntu/ubuntu-18.04.4-live-server-amd64.iso"
  }
}
  
resource "vsphere_virtual_machine" "vm4" {
  name             = "Prod"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus                   = 2
  memory                     = 8192
  guest_id                   = "ubuntu64Guest"
  wait_for_guest_net_timeout = -1

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 70
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "ISOs/Ubuntu/ubuntu-18.04.4-live-server-amd64.iso"
  }
}