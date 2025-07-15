resource "google_storage_bucket" "dags" {
  name          = "${var.environment}-composer-dags-${var.project_id}"
  location      = "US"
  force_destroy = true
}
