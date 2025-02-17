terraform {
  backend "gcs" {
    bucket = "terraform-devops-gke-statefile"
    prefix = "acr-terraform-gcp"
  }
}

resource "google_compute_network" "client-vpc" {
  name                    = "client-acr-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "client-sub" {
  name          = "client-acr-sub"
  ip_cidr_range = "10.128.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.client-vpc.id
}

resource "google_compute_firewall" "client-fwl-ssh" {
  name    = "client-acr-fwl-allow-ssh22"
  network = google_compute_network.client-vpc.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

resource "google_compute_firewall" "client-fwl-http" {
  name    = "client-acr-fwl-allow-http80"
  network = google_compute_network.client-vpc.id
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-tag"]
}

resource "google_compute_instance" "client-instance" {
  name         = "client-acr-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = [tolist(google_compute_firewall.client-fwl-http.target_tags)[0], tolist(google_compute_firewall.client-fwl-ssh.target_tags)[0]]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.client-sub.id
  }
  metadata_startup_script = file("${path.module}/app-installer-script.sh")
}