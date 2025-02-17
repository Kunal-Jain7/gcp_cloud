terraform {
  backend "gcs" {
    bucket = "terraform-devops-gke-statefile"
    prefix = "acr-terraform-gcp"
  }
}