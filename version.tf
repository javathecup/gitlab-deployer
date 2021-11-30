terraform {
  backend "gcs" {
    bucket = "sidespin-tf-state"
    prefix = "terraform/gitlab"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.88.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.6.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.3.0"
    }
  }
  required_version = ">= 1.0.0"
}