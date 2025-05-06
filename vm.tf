resource "oci_core_instance" "my_vm" {
  compartment_id      = var.compartment_ocid  # The compartment where your instance will be created
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"  # Availability Domain (AD)
  shape               = "VM.Standard2.1"  # VM shape (you can change it based on your needs)
  display_name        = "MyVMab"  # Instance name

  # VNIC configuration (subnet_id moved here)
  create_vnic_details {
    subnet_id = data.terraform_remote_state.workspace_1.outputs.subnet_public_id  # Using the subnet ID from Workspace 1
    assign_public_ip = true  # If you want the VM to have a public IP, you can set this to true
  }

  # Source details block
  source_details {
    source_type = "image"  # Image source type
    source_id   = "ocid1.image.oc15.ap-dcc-gazipur-1.aaaaaaaaknrel32tnjjo4n3fuodfmxbehhwp336yafixsvm7etw2olsgterq"  # Your image ID
  }

  metadata = {
    ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCj6YtazSHpf78S++fuBgSkzFJy8E3FgvVFRc3IbcoGAKj9kLvUQd/Bwny0Cb8ZrGcoJGqifrmoupShBXnta3IXfMOYLGJ09Hy7U2BZO4UQ2R5leL32WHvG92mlsJ8LJ51NfVYaSsrUHExZYRRpO79uFsOShKrQuZKR8Wt47hd2Pnkf8A+5BmmmxteVMXjo9HzhYxKjk6Mb0xyxhcChFuTi4A2PcY9QbO/iHlor3p4cqCS5bIV5G4TMLBmleYdemZ/K2PoejCEbqYeEGSWlTDTTl3dBsuEkiuN2s7ZoYVC3zdHyl6t4isWemXYxTNetymBGaT0Sb0/NhVomu5KpZgyx"  # Replace with your SSH public key
  }

  # Optional: You can add other configuration here such as block storage, network interfaces, etc.
}
