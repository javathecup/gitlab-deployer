# GitLab Template

GitLab Self-Managed deployment to Google Cloud from Cloudbuild. This repo contains:

- A good working example of workload identity federation.
- With the release of GitLab 14.5 we now have RBAC control of runners providing a secure connection between: GitLab<->Runner<->K8s Culster<->Pod<->K8s SA<->Google SA<->Google Cloud IAM
- Deployment uses Google CloudSQL instead of the default Helm chart (stateful set in pod)
- Deploys SSL automatically
- Supports Enterprise Edition (can be configured for community edition)

This added flexibility provides a semi-elastic deployment of GitLab on Google Cloud and the runner integration with workload identity lets GitLab consume Google Cloud products in a very easy way.

1. Fork this repo
2. Create a unique storage bucket name, rename bucket in versions.tf
```
  backend "gcs" {
    bucket  = "" # bucket name
    prefix  = "terraform/state"
  }
```
3. Enable the CloudBuild API, Kubernetes API (which turns on compute api), Service Usage API, Cloud DNS API (optional if you're hosting your own domain zone)
4. Cloud Build Service Account - give Owner (finer permissions are listed below)
5. Create external IP address, Reserve static address, Premium Tier, IPv4, regionalized
6. Create DNS entries for gitlab, registry
7. Go to CloudBuild, create a trigger, Push to branch, connect repo "Cloud Build GitHub App", connect this repo, "Cloud Build configruation file (yaml),
8. Add variables to cloudbuild located in cloudbuild.yaml file
  1. _CERTMANAGER_EMAIL
  2. _DOMAIN
  3. _GITLAB_HELM_VERSION - tested up to 5.4.2
  4. _IP - External IP defined earlier
  5. _PROJECT_ID - google project id
  6. _REGION - Google cloud region

## Create a cloud storage bucket and change the variable in "versions.tf" 
- cloud storage will be used as terraform backend

## IAM roles needed for cloudbuild service account (minimum permission)
- Cloud Build Service Account
- Cloud Memorystore Redis Admin
- Cloud SQL Admin
- Compute Admin
- Compute Network Admin
- Kubernetes Engine Admin
- Security Admin
- Service Account Admin
- Service Account Key Admin
- Service Account User
- Service Usage Admin

### Run Kubernetes commands to get root password
- kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo