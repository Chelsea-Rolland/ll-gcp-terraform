variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "<PROJECT_ID GOES HERE>"
  nullable    = false
}

variable "gcp_region" {
  type        = string
  description = "Name GCP Region"
  default     = "us-central1"
  nullable    = false
}

variable "gcp_zone" {
  type        = string
  description = "Name GCP Zone"
  default     = "us-central1-a"
  nullable    = false
}

variable "bucket_name" {
  type        = string
  description = "List of bucket names with the project id"
}

variable "storage_class" {
  type        = string
  description = "The storage class of the Storage Bucket to create"
}

variable "vpc_network_name" {
  type        = string
  description = "Name of the VPC Network"
}

variable "vm_instance_name" {
  type        = string
  description = "Name of the VM Instance"
}

variable "vm_instance_machine_type" {
  type        = string
  description = "Machine type for the VM Instance"
  sensitive   = true
}

variable "resoucre_tags" {
  type        = map(string)
  description = "Tags to set for all VM Resources"
}

variable "location" {
  type        = string
  description = "Bucket Location Continent"
  default     = "US"
}
