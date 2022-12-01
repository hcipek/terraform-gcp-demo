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

resource "google_cloud_run_service" "angular_service" {
  name     = "terraform-cloudrun-test"
  location = var.region

  template {
    spec {
      containers {
        image = "europe-west4-docker.pkg.dev/hakans-playground/terraform-test/angular:latest"
        # args    = ["value"]
        # command = ["value"]
        # dynamic "env" {
        #   for_each = var.envs
        #   content {
        #     name  = env.key
        #     value = env.value
        #   }
        # }
        ports {
          container_port = 80
        }
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
resource "google_cloud_run_service_iam_member" "run_all_users_angular" {
  service  = google_cloud_run_service.angular_service.name
  location = google_cloud_run_service.angular_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service" "java_service" {
  name     = "terraform-cloudrun-test"
  location = var.region

  template {
    spec {
      containers {
        image = "europe-west4-docker.pkg.dev/hakans-playground/terraform-test/java:latest"
        # args    = ["value"]
        # command = ["value"]
        # dynamic "env" {
        #   for_each = var.envs
        #   content {
        #     name  = env.key
        #     value = env.value
        #   }
        # }
        ports {
          container_port = 8080
        }
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
resource "google_cloud_run_service_iam_member" "run_all_users_java" {
  service  = google_cloud_run_service.java_service.name
  location = google_cloud_run_service.java_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}