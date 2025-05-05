output "vm_id" {
  value = oci_core_instance.my_vm.id
}

output "subnet_public_id" {
  value = data.terraform_remote_state.workspace_1.outputs.subnet_public_id
}
