# Fetch outputs from Workspace 1 using remote state
data "terraform_remote_state" "vcn_workspace_state" {
  backend = "remote"
  config = {
    organization = "your_organization"   # Replace with your organization name
    workspaces = {
      name = "vcn-workspace"  # Replace with the actual name of Workspace 1
    }
  }
}

# Output for VM creation
output "vcn_id_from_workspace_1" {
  value = data.terraform_remote_state.vcn_workspace_state.outputs.vcn_id
}

output "subnet_public_id_from_workspace_1" {
  value = data.terraform_remote_state.vcn_workspace_state.outputs.subnet_public_id
}

output "subnet_private_id_from_workspace_1" {
  value = data.terraform_remote_state.vcn_workspace_state.outputs.subnet_private_id
}
