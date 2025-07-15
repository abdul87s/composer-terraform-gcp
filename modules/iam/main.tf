resource "google_service_account" "composer" {
  account_id   = "composer-sa"
  display_name = "Composer Service Account"
}

resource "google_project_iam_member" "composer_roles" {
  for_each = toset([
    "roles/composer.worker",
    "roles/storage.admin"
  ])
  role   = each.key
  member = "serviceAccount:${google_service_account.composer.email}"
}
