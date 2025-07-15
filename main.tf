resource "google_project_service" "composer" {
  project = var.project_id
  service = "composer.googleapis.com"
}

resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
}

resource "google_project_service" "storage" {
  project = var.project_id
  service = "storage.googleapis.com"
}

resource "google_project_service" "compute" {
  project = var.project_id
  service = "compute.googleapis.com"
}

resource "google_project_service" "cloudresourcemanager" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
}
#test
resource "google_project_service" "serviceusage" {
  project = var.project_id
  service = "serviceusage.googleapis.com"
}
module "gcs" {
  source       = "./modules/gcs"
  environment  = var.environment
  project_id   = var.project_id
}

module "iam" {
  source       = "./modules/iam"
  project_id   = var.project_id
}
module "composer" {
  source            = "./modules/composer"
  project_id        = var.project_id
  region            = var.region
  composer_env_name = var.composer_env_name
  dag_bucket_name   = var.dag_bucket_name
  composer_sa_name  = var.composer_sa_name
}


