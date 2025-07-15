provider "google" {
  credentials = file(var.gcp_sa_key)
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  credentials = file(var.gcp_sa_key)
  project     = var.project_id
  region      = var.region
}
