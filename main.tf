terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.31.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = var.project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_network_name
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_instance_name
  machine_type = var.vm_instance_machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  tags = [var.resoucre_tags["location"], var.resoucre_tags["env"]]
}

module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.3.0"
  # insert the 3 required variables here
  names      = [var.bucket_name]
  prefix     = "demo"
  project_id = var.project_id
  location   = var.location
  lifecycle_rules = [{
    condition = {
      age = 5
    }
    action = {
      type = "Delete"
    }
    condition = {
      age = 3
    }
    action = {
      type          = "SetStorageClass"
      storage_class = var.storage_class
    }
  }]
}
