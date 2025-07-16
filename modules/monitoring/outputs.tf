output "notification_channel_id" {
  value       = google_monitoring_notification_channel.email.id
  description = "ID of the notification channel"
}

output "uptime_check_id" {
  value       = google_monitoring_uptime_check_config.composer_webserver.id
  description = "ID of the uptime check config"
}

output "alert_policy_id" {
  value       = google_monitoring_alert_policy.uptime_alert.id
  description = "ID of the alert policy"
}
