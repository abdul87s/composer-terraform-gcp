variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

variable "region" {
  description = "The GCP region where resources will be created."
  type        = string
  default = "europe-west2"
}

variable "gcp_sa_key" {
  description = "Path to the service account JSON key.  Consider using Google Cloud Secret Manager for better security."
  type        = string
  sensitive   = true
}

variable "composer_env_name" {
  description = "The name of the Cloud Composer environment."
  type        = string
  default = "ci-cd-composer-env"
}

variable "dag_bucket_name" {
  description = "The name of the Cloud Storage bucket to store DAGs."
  type        = string
  default = "ci-cd-dag-bucket"
}

variable "composer_sa_name" {
  description = "The name of the service account used by the Cloud Composer environment."
  type        = string
  default = "ci-cd-composer-sa"
}

variable "environment" {
  description = "The deployment environment (e.g., dev, prod)."
  type        = string
  default     = "dev"
}

