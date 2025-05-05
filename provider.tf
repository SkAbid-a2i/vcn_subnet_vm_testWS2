provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  region       = var.region
}

# Define necessary variables for OCI authentication
variable "tenancy_ocid" {
  description = "The OCID of the tenancy"
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user"
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the user"
  type        = string
}

variable "private_key" {
  description = "The private key for authentication"
  type        = string
}

variable "region" {
  description = "The OCI region"
  type        = string
}

variable "compartment_ocid" {
  description = "The OCID of the compartment"
  type        = string
}
