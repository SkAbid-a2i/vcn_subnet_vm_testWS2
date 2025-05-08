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
  shape               = "VM.Standard.E4.Flex"  # Compatible flexible shape
  display_name        = "MyVMab"

  # Shape configuration for 1 OCPU and 8 GB RAM
  shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }

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
    default= "ocid1.image.oc15.ap-dcc-gazipur-1.aaaaaaaadnihds4lqrmii4g6izwcwxcpfyevnyim35ixyajxx4jz63jqunsa"
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
