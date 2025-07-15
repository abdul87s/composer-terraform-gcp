terraform {
  backend "gcs" {
    bucket  = "dev-terraform-state-bucket-1"  # Replace with your GCS bucket name
    prefix  = "composer/bootstrap"
  }
}
