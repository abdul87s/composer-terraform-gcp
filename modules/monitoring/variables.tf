variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "webserver_url" {
  description = "The Composer webserver URL (without https://)"
  type        = string
}

variable "notification_email" {
  description = "Email to send alerts to"
  type        = string
}
