# GitLab Template

## Create a cloud storage bucket and change the variable in "main.tf" 
- cloud storage will be used as terraform backend

## Add iam role to cloud build
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
```
  backend "gcs" {
    bucket  = "" # backet name
    prefix  = "terraform/state"
  }
```
## Change vars in "cloudbuild.yaml"
```
    - 'TF_VAR_project_id=' # enter project id
    - 'TF_VAR_certmanager_email=' #  enter email
    - 'TF_VAR_domain=sidespin.com' # enter domain -> gitlab will be accecible via gitlab.domain
    - 'TF_VAR_gitlab_ee=true' # true for Enterprise Edition (EE)
```
## GCP setup
- activate cloud build
- grant owner role to cloud build
- connect repo to cloudbuild
### Run Kubernetes commands to get root password
- kubectl get ns
- kubectl get secrets
- kubectl get secret gitlab-gitlab-initial-root-password -o yaml
- echo "{copied root password from above command}" | base64 --decode
