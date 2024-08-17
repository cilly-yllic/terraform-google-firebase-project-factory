terraform {
  required_version = "~> 1.9.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.41.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.41.0"
    }
  }
}