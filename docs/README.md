# Tractus-X & EDC Deployment on Minikube

## Quick Start

1. Run this script to scaffold the project and start Minikube:

```bash
./tractusx_edc_project.sh
```

2. Change directory and deploy everything on Minikube:

```bash
cd tractusx-edc-project
./deploy_minikube.sh
```

3. Patch your /etc/hosts to resolve local DNS names:

```bash
./patch-hosts.sh
```

4. Access Argo CD UI at:

```
https://localhost:8080
```

Login credentials:

- Username: admin  
- Password:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo
```

## Configuration

- Helm charts under `helm/`
- Terraform under `terraform/`
- CI/CD workflows under `ci-cd/`

## Testing

- Postman collection available under `test/postman/`
