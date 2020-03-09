output "network" {
  value = data.vsphere_network.network
}
output "cluster" {
  value = data.vsphere_compute_cluster.cluster
}
output "datastore" {
  value = data.vsphere_datastore.datastore
}
output "template" {
  value = data.vsphere_virtual_machine.template
}
output "dc" {
  value = data.vsphere_datacenter.dc
}

