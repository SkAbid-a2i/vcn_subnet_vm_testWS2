data "terraform_remote_state" "workspace_1" {
  backend = "remote"
  config = {
    organization = "your_organization_name"   # Replace with your organization name
    workspaces = {
      name = "vcn_subnet_vm_testWS1"          # Workspace 1 name where VCN and subnet are created
    }
  }
}

# Outputs from Workspace 1
output "subnet_public_id" {
  value = data.terraform_remote_state.workspace_1.outputs.subnet_public_id
}

output "subnet_private_id" {
  value = data.terraform_remote_state.workspace_1.outputs.subnet_private_id
}
