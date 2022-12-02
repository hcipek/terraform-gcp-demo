output "angular_url" {
  value = google_cloud_run_service.angular_service.status[0].url
}

output "java_url" {
  value = google_cloud_run_service.java_service.status[0].url
}