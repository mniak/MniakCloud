terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "google" {
  project = var.ProjectName
  region  = var.Region
  zone    = var.Zone
}

provider "google-beta" {
  project = var.ProjectName
  region  = var.Region
  zone    = var.Zone
}
