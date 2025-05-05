resource "oci_core_instance" "my_vm" {
  compartment_id      = var.compartment_ocid  # Reference the compartment OCID from variables
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"  # Specify Availability Domain (AD)
  shape               = "VM.Standard2.1"  # Define the VM shape
  display_name        = "MyVMab"  # Display name for your VM
  subnet_id           = data.terraform_remote_state.workspace_1.outputs.subnet_public_id  # Reference subnet_id from Workspace 1
  image_id            = var.image_id  # Use the image_id variable (this will reference the value in terraform.tfvars)
}
