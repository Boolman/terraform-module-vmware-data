terraform {
  backend "consul" {}
}
provider "vsphere" {}

data "vsphere_datacenter" "dc" {
  for_each = toset(list(var.dc))
  name     = each.key
}

data "vsphere_virtual_machine" "template" {
  for_each      = toset(var.template)
  name          = each.key
  datacenter_id = data.vsphere_datacenter.dc[var.dc].id
}

data "vsphere_datastore" "datastore" {
  for_each      = toset(list(var.datastore))
  name          = each.key
  datacenter_id = data.vsphere_datacenter.dc[var.dc].id
}

data "vsphere_compute_cluster" "cluster" {
  for_each      = toset(list(var.cluster))
  name          = each.key
  datacenter_id = data.vsphere_datacenter.dc[var.dc].id
}

data "vsphere_network" "network" {
  for_each      = toset(var.vlan)
  name          = each.key
  datacenter_id = data.vsphere_datacenter.dc[var.dc].id
}
