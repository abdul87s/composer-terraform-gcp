resource "google_service_account" "composer_sa" {
  account_id   = var.composer_sa_name
  display_name = "Service Account for Cloud Composer"
  project      = var.project_id
}
resource "google_project_iam_member" "composer_sa_roles" {
  for_each = toset([
    "roles/composer.worker",
    "roles/storage.admin",
    "roles/logging.logWriter"
  ])
  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.composer_sa.email}"
}
resource "google_storage_bucket" "dag_bucket" {
  name          = var.dag_bucket_name
  location      = var.region
  project       = var.project_id
  force_destroy = true
}
# resource "google_composer_environment" "composer_env" {
#   name   = var.composer_env_name
#   region = var.region
#   project = var.project_id

#   config {
#     node_count = 3

#     software_config {
#       image_version = "composer-2.3.5-airflow-2.7.3"
#       python_version = "3"
#     }

#     node_config {
#       service_account = google_service_account.composer_sa.email
#     }
#   }

#   depends_on = [
#     google_storage_bucket.dag_bucket,
#     google_project_iam_member.composer_sa_roles
#   ]
# }

resource "google_composer_environment" "composer_env" {
  name    = var.composer_env_name
  region  = var.region
  project = var.project_id

  config {
    environment_size = "ENVIRONMENT_SIZE_SMALL"  # Optional, adjust as needed
    workloads_config {
      scheduler {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 10
        count      = 1
      }

      web_server {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 10
      }

      worker {
        cpu        = 1
        memory_gb  = 4
        storage_gb = 20
        min_count  = 1
        max_count  = 3
      }
    }

    software_config {
      image_version   = "composer-3-airflow-2.9.3" # 👈 Use a valid Composer 3 version
    }

    node_config {
      service_account = google_service_account.composer_sa.email
    }
  }

  depends_on = [
    google_storage_bucket.dag_bucket,
    google_project_iam_member.composer_sa_roles
  ]
}
