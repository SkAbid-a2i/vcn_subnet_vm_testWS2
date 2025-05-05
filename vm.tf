resource "oci_core_instance" "my_vm" {
  compartment_id   = var.compartment_ocid
  availability_domain = "Uocm:PHX-AD-1"  # Specify your availability domain
  shape             = "VM.Standard2.1"
  display_name      = "VM-${terraform.workspace}"
  image_id          = var.image_ocid

  # Use the subnet ID from Workspace 1
  subnet_id         = data.terraform_remote_state.vcn_workspace_state.outputs.subnet_public_id
}

output "vm_id" {
  value = oci_core_instance.my_vm.id
}
