terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.44.1"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_cloud_run_service" "my_test_service" {
  name     = "terraform-cloudrun-test"
  location = var.region

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
        # args    = ["value"]
        # command = ["value"]
        # dynamic "env" {
        #   for_each = var.envs
        #   content {
        #     name  = env.key
        #     value = env.value
        #   }
        # }
        # ports {
        # }
        # resources {

        # }
        # volume_mounts {

        # }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_service.my_test_service.name
  location = google_cloud_run_service.my_test_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}