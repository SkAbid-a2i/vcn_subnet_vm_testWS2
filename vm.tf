resource "oci_core_instance" "my_vm" {
  compartment_id      = var.compartment_ocid
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"  # Use the correct AD based on your region
  shape               = "VM.Standard2.1"  # Use the appropriate shape for your VM
  display_name        = "MyVM"
  subnet_id           = data.terraform_remote_state.workspace_1.outputs.subnet_public_id  # Public subnet ID from Workspace 1
  image_id            = var.image_id  # Provide the correct image ID for the VM
}
