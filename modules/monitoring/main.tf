resource "google_monitoring_notification_channel" "email" {
  display_name = "Email Notifications"
  type         = "email"

  labels = {
    email_address = var.notification_email
  }
}

resource "google_monitoring_uptime_check_config" "composer_webserver" {
  display_name = "Composer Webserver Uptime Check"
  timeout      = "10s"
  period       = "60s"

  http_check {
    path         = "/"
    port         = 8080
    use_ssl      = true
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = var.project_id
      host       = var.webserver_url
    }
  }
}

resource "google_monitoring_alert_policy" "uptime_alert" {
  display_name = "Composer Webserver Down Alert"

  combiner = "OR"

  conditions {
    display_name = "Uptime check failed"

    condition_threshold {
      filter          = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" resource.type=\"uptime_url\""
      duration        = "60s"
      comparison = "COMPARISON_GT"  # or "COMPARISON_LT"
      threshold_value = 0
      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_NEXT_OLDER"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.id]

  enabled = true
}
