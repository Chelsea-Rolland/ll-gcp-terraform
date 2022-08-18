project_id               = "qwiklabs-gcp-03-b4005dc6bd1f"
gcp_region               = "us-central1"
gcp_zone                 = "us-central1-a"
bucket_name              = "qwiklabs-gcp-03-b4005dc6bd1f-1"
storage_class            = "COLDLINE"
vpc_network_name         = "terraform-demo-network"
vm_instance_name         = "terraform-demo-instance"
vm_instance_machine_type = "f1-micro"
resoucre_tags = {
  env      = "dev"
  project  = "terraform-gcp-demo"
  location = "web"
}
