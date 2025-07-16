terraform {
  backend "gcs" {
    bucket = "dev-terraform-state-bucket-dev"
    prefix = "dev/terraform.tfstate"
  }
}
