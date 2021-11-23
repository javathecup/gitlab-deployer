variable "project_id" {
  description = "GCP Project to deploy resources"
}
variable "region" {
  description = "GCP region to deploy resources to"
  default     = "us-central1"
}
variable "gitlab_helm_version" {}
variable "certmanager_email" {
  description = "Email used to retrieve SSL certificates from Let's Encrypt"
}
variable "domain" {
  description = "Domain for hosting gitlab functionality (ie mydomain.com would access gitlab at gitlab.mydomain.com)"
}
variable "ip" {
  description = "static external ip address"
}
