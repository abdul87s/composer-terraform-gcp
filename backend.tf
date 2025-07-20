terraform {
  backend "gcs" {
    bucket  = "dev-terraform-state-bucket-15"
    prefix  = "composer/bootstrap"
  }
}
