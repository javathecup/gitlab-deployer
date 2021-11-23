provider "google" {
  project     = var.project_id
}

provider "kubernetes" {
  host                   = "https://${module.gitlab-kubernetes-engine.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gitlab-kubernetes-engine.ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gitlab-kubernetes-engine.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gitlab-kubernetes-engine.ca_certificate)
  }
}

data "google_client_config" "default" {}