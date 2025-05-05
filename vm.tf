resource "oci_core_instance" "my_vm" {
  compartment_id      = var.compartment_ocid  # The compartment where your instance will be created
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"  # Availability Domain (AD)
  shape               = "VM.Standard2.1"  # VM shape (you can change it based on your needs)
  display_name        = "MyVMab"  # Name of your instance
  subnet_id           = data.terraform_remote_state.workspace_1.outputs.subnet_public_id  # Using the subnet ID from Workspace 1

  # Source details block
  source_details {
    source_type = "image"  # Image source type
    image_id    = "ocid1.image.oc15.ap-dcc-gazipur-1.aaaaaaaaknrel32tnjjo4n3fuodfmxbehhwp336yafixsvm7etw2olsgterq"  # Your image ID
  }

  metadata = {
    ssh_authorized_keys = "ssh-rsa YOUR_SSH_PUBLIC_KEY"  # Replace with your SSH public key
  }

  # Optional: You can add other configuration here such as block storage, network interfaces, etc.
}
