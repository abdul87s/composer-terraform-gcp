output "composer_env_name" {
  value = google_composer_environment.composer_env.name
}

output "composer_env_gke_cluster" {
  value = google_composer_environment.composer_env.config[0].maintenance_window
}

output "composer_sa_email" {
  value = google_service_account.composer_sa.email
}

output "dag_bucket_name" {
  value = google_storage_bucket.dag_bucket.name
}
