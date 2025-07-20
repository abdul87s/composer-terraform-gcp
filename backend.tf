terraform {
  backend "gcs" {
    bucket  = "dev-terraform-state-bucket-12"
    prefix  = "composer/bootstrap"
  }
}
