# The provider of the resources used below, including version number
terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "4.51.0"
        }
    }
}

# pass the filename in at runtime
variable "filename" {
    type = string
}

# our google credential/secret stored locally
provider "google" {
    credentials = file(var.filename)

    project = "terraform-compute-engine"
    region = "us-central1"
    zone = "us-central1-c"
}

# vpc network required to deploy our compute instance into
resource "google_compute_network" "vpc_network" {
    name = "terraform-network"
}