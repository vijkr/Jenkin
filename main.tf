provider "google" {
  project     = "thematic-carver-414815"
  credentials = "vij.json"
  #credentials = file("tcb-project-371706-b114ce01e529.json")
  region      = "us-east1"

}

resource "google_compute_network" "vpc1" {
  name                    = "my-custom-network-1"
  auto_create_subnetworks = "false"

}

resource "google_compute_subnetwork" "my-custom-subnet1" {
  name          = "my-custom-subnet-1"
  ip_cidr_range = "10.255.196.0/24"
  network       = google_compute_network.vpc1.name
  region        = "us-east1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "nginx-instance"
  machine_type = "f1-micro"

  tags = ["nginx-instance"]
}


#### test file to push

##git credentialsId: '7eb642ca-f357-4553-963f-d5907d92cc6e', url: 'https://github.com/vijkr/jenkin.git'