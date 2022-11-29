output "url" {
  value = google_cloud_run_service.my_test_service.status[0].url
}