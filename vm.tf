resource "oci_core_instance" "my_vm" {
  compartment_id      = var.compartment_ocid  # This will now reference the declared variable
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"  # Example AD
  shape               = "VM.Standard2.1"  # VM shape
  display_name        = "MyVMab"
  subnet_id           = data.terraform_remote_state.workspace_1.outputs.subnet_public_id
  image_id            = var.image_id  # Image ID for the instance
}
