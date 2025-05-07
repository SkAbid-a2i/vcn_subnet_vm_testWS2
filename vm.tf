# vm.tf

# Data source to get the latest Oracle Linux 8 image
data "oci_core_images" "oracle_linux_images" {
  compartment_id = var.compartment_ocid
  operating_system = "Oracle Linux"
  operating_system_version = "8"
  sort_by = "TIMECREATED"
  sort_order = "DESC"
}

# Compute Instance (VM)
resource "oci_core_instance" "my_vm" {
  compartment_id      = var.compartment_ocid
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"
  shape               = "VM.DenseIO.E4.Flex"  # Compatible shape, 1 OCPU, ~8 GB RAM
  display_name        = "MyVMab"

  # VNIC configuration
  create_vnic_details {
    subnet_id        = data.terraform_remote_state.workspace_1.outputs.subnet_public_id
    assign_public_ip = true
    display_name     = "vnic-my-vm"
  }

  # Source details for the VM
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_images.images[0].id
  }

  # Metadata for SSH access
  metadata = {
    ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC31LmewK1WT57zgFAI6OigT9xTZrltlLn7vLKX/kXQIHw2n50L6YhKj3ewNlLHzsYoKqCsqy9Qo86gsg9i5uLBYhnj2Mz4KUVons4zz1Qkgb6UlPaUx7NCbF9A5RXPYlg73zgg6FdqqjZr02ijlunMZHyrPWK/EbxO2q4eLUrkFWwdADJtwpNwXB/6sgbKVOlJ7oLOsERJk6J4kXK3P7J/0JKHG0BfEwt/EO6ZDlGtpunS+BD3GcDWXr66gy9qKJc0ZKo00D5CSnh6KttQb04nWe43bAVAaGsx35WeIxqvAgndMXiGcwnyrYqiReUXG3+h7ZpAZeuIpGCxHMCXvoyF"
  }

  # Optional: Specify fault domain for high availability
  fault_domain = "FAULT-DOMAIN-1"
}

# Output to verify the image OCID being used
output "selected_image_ocid" {
  value = data.oci_core_images.oracle_linux_images.images[0].id
}
