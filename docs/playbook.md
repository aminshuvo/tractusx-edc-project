# Operational Playbook

## Production Architecture
- Isolate EDC and Tractus-X in separate namespaces
- Use external Postgres and Vault in production

## Disaster Recovery & Backup
- Use Velero or Restic

## Observability
- Prometheus, Grafana, Loki

## CI/CD
- GitHub Actions or Argo CD

## Secrets Management
- Recommended: External Vault or Sealed Secrets
