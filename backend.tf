terraform {
  backend "gcs" {
    bucket  = "dev-terraform-state-bucket-12"  # Replace with your GCS bucket name
    prefix  = "composer/bootstrap"
  }
}
