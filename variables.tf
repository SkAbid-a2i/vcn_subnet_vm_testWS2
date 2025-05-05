variable "tenancy_ocid" {
  description = "The OCID of the tenancy used to sign the request to OCI."
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user used to sign the request to OCI."
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the user used to sign the request to OCI."
  type        = string
}

variable "private_key" {
  description = "The private key used to sign the request to OCI."
  type        = string
}

variable "region" {
  description = "The OCI region where resources will be created."
  type        = string
}

variable "compartment_ocid" {
  description = "The OCID of the compartment where the resources will be created."
  type        = string
}

variable "image_id" {
  description = "The OCID of the image to be used for creating instances."
  type        = string
}
